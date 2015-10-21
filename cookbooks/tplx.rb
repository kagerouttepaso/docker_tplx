#
# Cookbook Name:: my_settings
# Recipe:: default
#
# Copyright 2014, kitsunai daisuke
#
# MIT
#

#環境チェック
if node[:platform] != "ubuntu" || node[:platform_version] != "12.04" then
  raise "this recipe is Ubuntu12.04 only"
end

#テンポラリディレクトリの作成
tmp_dir="#{Chef::Config[:file_cache_path]}"
directory tmp_dir

#必要パッケージのインストール
%w{sudo unzip make gcc gcc-4.4-arm-linux-gnueabi g++-4.4-arm-linux-gnueabi}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

###TPLX3ライブラリのインストール
#作業フォルダ作成
tft_dir=tmp_dir+"/tplx3lib" 
directory tft_dir
#ファイルダウンロード
remote_file tft_dir+"/Tplx3-1.1.2.zip" do
  source "http://wiki.tpip-dev.org/upload/3/30/Tplx3-1.1.2.zip"
  action :create
  notifies :run, "execute[unzip_tplx3lib]", :immediately
end
#ファイル解凍
execute "unzip_tplx3lib" do
  action :nothing
  cwd tft_dir
  command "unzip Tplx3-1.1.2.zip"
  notifies :run, "execute[install_tplx3lib]", :immediately
end
#ライブラリインストール
execute "install_tplx3lib" do
  action :nothing
  cwd tft_dir+"/tplx3-1.1.2"
  command "./install.sh"
end


###TFTのインストール
#作業フォルダ作成
tft_dir=tmp_dir+"/tft"
directory tft_dir
remote_file tft_dir+"/Tft_tpip3.zip" do
  source "http://wiki.tpip-dev.org/upload/8/89/Tft_tpip3.zip"
  action :create
  notifies :run, "execute[unzip_tft]", :immediately
end
#ファイル解凍
execute "unzip_tft" do
  action :nothing
  cwd tft_dir
  command "unzip Tft_tpip3.zip"
  notifies :run, "execute[install_tft]", :immediately
end
#ビルド & インストール
execute "install_tft" do
  action :nothing
  cwd tft_dir+"/tft_tpip3"
  command "make && ./install.sh"
end
