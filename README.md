コマンドライン環境用ツールボックス
==================================

構成
----

```
/usr/local
├─bin/
├─lib/
└─toolbox/
    ├─arch/                   ←tarballダウンロード先
    ├─build/                  ←tビルド作業ディレクトリ
    ├─docker/
    │  ├─centos5/
    │  │  ├─usr/local/toolbox/
    │  │  └─Dockerfile
    │  ├─centos6/
    │  │  ├─usr/local/toolbox/
    │  │  └─Dockerfile
    │  ├─centos7/
    │  │  ├─usr/local/toolbox/
    │  │  └─Dockerfile
    │  ├─ubuntu1604/
    │  │  ├─usr/local/toolbox/
    │  │  └─Dockerfile
    │  └─docker-compose.yml
    ├─log/                    ←ビルド結果のログ出力
    ├─scripts/
    │  ├─build-all.sh        ←ビルドスクリプト（個別のビルドスクリプトを全て実行する）
    │  ├─build-common.sh     ←共通設定用のスクリプト（個別のビルドスクリプトから呼び出される）
    │  ├─build-autoconf.sh   ←個別のビルドスクリプト
    │  └─build-m4.sh         ←個別のビルドスクリプト
    └─build.sh

```


ビルド＆インストール
--------------------

```sh
$ build.sh
```

スクリプトテスト
----------------

異なるLinuxディストリビューションでのスクリプトの動作検証を行うため、
dockerでビルドとインストールを実行できるようにした。

```sh
$ cd docker
$ centos5/build.sh
$ centos6/build.sh
$ centos7/build.sh
$ ubuntu1604/build.sh
```
