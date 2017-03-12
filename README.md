コマンドライン環境用ツールボックス
==================================

構成
----

toolbox/
├─centos5/
│  ├─toolbox/            ←インストール先
│  │  └─build/          ←ビルド作業ディレクトリ
│  └─Dockerfile
├─centos7/
│  ├─toolbox/            ←インストール先
│  │  └─build/          ←ビルド作業ディレクトリ
│  └─Dockerfile
├─centos6/
│  ├─toolbox/            ←インストール先
│  │  └─build/          ←ビルド作業ディレクトリ
│  └─Dockerfile
├─common/
│  └─opt/
│      └─toolbox/
│          ├─recipe/
│          │  ├─build.sh            ←ビルドスクリプト（個別のビルドスクリプトを全て実行する）
│          │  ├─build-common.sh     ←共通設定用のスクリプト（個別のビルドスクリプトから呼び出される）
│          │  ├─build-autoconf.sh   ←個別のビルドスクリプト
│          │  └─build-m4.sh         ←個別のビルドスクリプト
│          └─src/                    ←tarballダウンロード先
└─docker-compose.yml


ビルド＆インストール
--------------------

docker-compose run --rm centos5 /opt/toolbox/recipe/build.sh
docker-compose run --rm centos6 /opt/toolbox/recipe/build.sh
docker-compose run --rm centos7 /opt/toolbox/recipe/build.sh
