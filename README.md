コマンドライン環境用ツールボックス
==================================

構成
----

```
/toolbox/
├─bin/
├─lib/
└─my-linux-toolbox/
    ├─archives/               ←tarballダウンロード先
    ├─build/                  ←tビルド作業ディレクトリ
    ├─docker/
    │  ├─centos6/
    │  │  ├─opt/toolbox/
    │  │  └─Dockerfile
    │  ├─ubuntu1604/
    │  │  ├─opt/toolbox/
    │  │  └─Dockerfile
    │  └─docker-compose.yml
    ├─log/                    ←ビルド結果のログ出力
    └─scripts/
        ├─build-all.sh        ←ビルドスクリプト（個別のビルドスクリプトを全て実行する）
        ├─build-common.sh     ←共通設定用のスクリプト（個別のビルドスクリプトから呼び出される）
        └─build-xxxx.sh       ←個別のビルドスクリプト

```


ビルド＆インストール
--------------------

```sh
$ ./scripts/build-all.sh
```

スクリプトテスト
----------------

異なるLinuxディストリビューションでのスクリプトの動作検証を行うため、
dockerでビルドとインストールを実行できるようにした。

```sh
$ cd docker
$ ./build.sh centos6
$ ./build.sh ubuntu1604
```
