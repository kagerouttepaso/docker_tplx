# docker_tplx
tplx build environment
TPLXのビルド環境構築済みのコンテナです。
dockerをインストール済みのマシンであればOSを問わずTPLXアプリのビルドが行えます。

## 必要な環境
dockerの動作可能なPC

## 使い方
 TPLXアプリのMakefileの存在するディレクトリをマウントしてdockerを起動してビルドを行います。
 
## ツール
### 自動ビルドスクリプト
下記のスクリプトをMakefileのあるディレクトリへコピーし、ビルドの際に実行してください。
./tool/build.sh 
./tool/build.bat
