# docker_tplx
tplx build environment
TPLXのビルド環境構築済みのコンテナです。
dockerをインストール済みのマシンであればOSを問わずTPLXアプリのビルドが行えます。

# 必要な環境
dockerの動作可能なPC
windowsは[docker_toolbox](https://www.docker.com/docker-toolbox)をインストールしてください。

# 使い方
 TPLXアプリのMakefileの存在するディレクトリをマウントしてdockerを起動してビルドを行います。
 
# ツール
## 自動ビルドスクリプト
下記のスクリプトをMakefileのあるディレクトリへコピーし、ビルドの際に実行してください。
### Linuxの場合
./build_script/linux/build.sh をコピーして実行してください。
### Windowsの場合
1. ./build_script/windows/mk_machine.bat をまず実行し、Windows上でDockerを動作させる仮想マシンを作成します。
2. ./build_script/windows/build.batをコピーして実行します。
3.  TPLXの開発が終了したら、./build_script/windows/rm_machine.batを実行し、仮想マシンを削除します。


