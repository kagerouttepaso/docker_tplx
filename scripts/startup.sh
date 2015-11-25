#!/bin/bash
cd /opt/scripts

HELP_MESSAGE='
このコンテナはTPLX_APPをビルドするための環境を構築したものです。 
下記のオプションをコンテナ名の後ろに設定して実行してください。

help 
  このヘルプを表示します

linux_script 
  linux用のビルドスクリプトを出力します。出力をパイプすることで、
  ビルド用のスクリプトファイルを作成することが出来ます。
  ex)
  docker run kagerouttepaso/tplx linux_script > build.sh
  ./build.sh

windows_script
  windows用のビルドスクリプトを出力します。出力をパイプすることで、
  ビルド用のスクリプトファイルを作成することが出来ます。
  ex)
  docker run kagerouttepaso/tplx windows_script > build.bat
  build.bat

build
  /src以下にマウントされたTPLX_APPのソースをビルドします。

rebuild
  /src以下にマウントされたTPLX_APPのソースをリビルドします。

clean
  /src以下にマウントされたTPLX_APPのソースをクリーンします

'
SRC_NOT_FOUTD_MESSAGE='
/src以下にフォルダがマウントされていません。
フォルダをマウントしてコンテナを起動してください。

linux ex1)
  docker run kagerouttepaso/tplx linux_script > build.sh
  ./build.sh

linux ex2)
  docker run --rm -v `pwd`:/src kagerouttepaso/tplx build

windows ex)
  docker run kagerouttepaso/tplx windows_script > build.bat
  build.bat


'

if [ "$1" = "help" ]; then
    echo "${HELP_MESSAGE}"

elif [ "$1" = "linux_script" ]; then
    cat ../build_script/linux/build.sh

elif [ "$1" = "windows_script" ]; then
    cat ../build_script/windows/build.bat

elif [ "$1" = "build" ]; then
    if [ ! -d /src ]; then
        echo "${SRC_NOT_FOUTD_MESSAGE}"
        exit 1
    fi
    cd /src
    make

elif [ "$1" = "rebuild" ]; then
    if [ ! -d /src ]; then
        echo "${SRC_NOT_FOUTD_MESSAGE}"
        exit 1
    fi
    cd /src 
    make clean 
    make

elif [ "$1" = "clean" ]; then
    if [ ! -d /src ]; then
        echo "${SRC_NOT_FOUTD_MESSAGE}"
        exit 1
    fi
    cd /src 
    make clean 
fi
