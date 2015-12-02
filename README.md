# docker_tplx
tplx build environment
TPLXのビルド環境構築済みのコンテナです。
dockerをインストール済みのマシンであればOSを問わずTPLXアプリのビルドが行えます。

# 必要な環境

- dockerの動作可能なLinux PC

## dockerのインストール方法
[こちらのリンク](https://docs.docker.com/linux/step_one/)を参考にインストールを行ってください。

例) ubuntuの場合

``` bash
#!/bin/bash
#wgetをインストール
sudo apt-get update
sudo apt-get install -y wget

#dockerをインストール
wget -qO- https://get.docker.com/ | sh

#dockerをsudo無しでインストール出来るようにする
sudo groupadd docker
sudo gpasswd -a ${USER} docker
sudo service docker restart
```

# 使い方
TPLXアプリのMakefileの存在するディレクトリをマウントしてdockerを起動してビルドを行います。

例)

```bash
cd ${PJ_DIR}
docker run --rm tpip/tplx linux_script | sh -
```

詳しい使用方法は`docker run --rm tpip/tplx`コマンドから確認できます。


 
## 自動ビルドスクリプト
下記のスクリプトをMakefileのあるディレクトリへコピーし、ビルドの際に実行してください。

1. `docker run --rm tpip/tplx linux_script > build.sh`を実行しビルドスクリプトをコピーします。
1. `./build.sh`を実行しビルドを実行します。

# Tips
- dockerを`--rm`オプションをつけずに実行するとコンテナの実行結果が溜まっていき、ストレージを圧迫していきます。
  その際は`docker ps -aq | xargs docker rm`コマンドで終了済みコンテナの消去が可能です。

# Windowsの場合
**Windows上での開発環境は現在製作中で、未だ正常に動作しません。下記は現在計画している開発プロセスになります。**

## 事前準備
[docker_toolbox](https://www.docker.com/docker-toolbox)をインストールしてください。

## ビルド方法

1. ./build_script/windows/mk_machine.bat をまず実行し、Windows上でDockerを動作させる仮想マシンを作成します。
2. ./build_script/windows/build.batをプロジェクトフォルダにコピーして実行します。
3.  TPLXの開発が終了したら、./build_script/windows/rm_machine.batを実行し、仮想マシンを削除します。

