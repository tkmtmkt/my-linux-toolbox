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
    │  ├─centos/
    │  │  ├─opt/toolbox/
    │  │  └─Dockerfile
    │  ├─ubuntu/
    │  │  ├─opt/toolbox/
    │  │  └─Dockerfile
    │  ├─docker-compose.yml
    │  ├─build.sh
    │  ├─exec.sh
    │  └─package.sh          ←ビルド結果のアーカイブを作成するスクリプト
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
$ ./build.sh centos
$ ./build.sh ubuntu
```
podmanを使用する場合のコマンド例

```sh
$ podman run -it --rm -h centos -v ..:/opt/toolbox centos_toolbox:7.7.1908 /bin/bash
$ podman run -it --rm -h ubuntu -v ..:/opt/toolbox ubuntu_toolbox:18.04 /bin/bash
```


内容
----

### 主要ツール

項目                                      | 説明
------------------------------------------|------
[vim](https://www.vim.org/)               | テキストエディタ
[git](https://git-scm.com/)               | 分散バージョン管理ツール
[tig](https://jonas.github.io/tig/)       | コンソールで使用するgitブラウザ
[tmux](https://github.com/tmux/tmux/wiki) | 端末多重接続ソフトウェア
[GnuPG](https://gnupg.org/index.html)     | 暗号化ソフト
[python](https://www.python.org/)         | プログラム言語
[ruby](https://www.ruby-lang.org/)        | プログラム言語
[lua](http://www.lua.org/)                | プログラム言語

### 補助ツール

 項目                                               | 説明
----------------------------------------------------|------
[curl](https://curl.haxx.se/)                       | ファイル転送ツール
[tar](https://www.gnu.org/software/tar/)            | ファイルアーカイバ
[p7zip](https://sourceforge.net/projects/p7zip/)    | ファイルアーカイバ
[highway](https://github.com/tkengo/highway/)       | 高速grep
[global](https://www.gnu.org/software/global/)      | ソースコードに索引付けを行うことで、大規模システムのハックやレビューを効率化するソフトウエア
[nkf](https://ja.osdn.net/projects/nkf/)            | 異なる文字コード間の変換を行うソフトウェア
[libxml2](http://xmlsoft.org/)                      | XMLデータの整形、抽出を行う（xmllintコマンド）
[jq](https://stedolan.github.io/jq/)                | JSONデータの整形、抽出を行うコマンド
[fio](https://https://github.com/axboe/fio)         | ディスク性能テストツール
[pwgen](https://sourceforge.net/projects/pwgen/)    | ランダムなパスワードを生成するコマンド
[bc](https://www.gnu.org/software/bc/)              | 任意精度計算機。シェルで数値計算を行うのに使用する。
[direnv](https://direnv.net/)                       | ディレクトリ毎に環境変数を定義して、そのディレクトリがカレントになった時だけ環境変数を有効/無効にするツール
[rlwrap](https://github.com/hanslub42/rlwrap/)      | ヒストリ機能などがないコマンドに、readline 相当の機能を後付けする wrapper コマンド
[parallel](https://www.gnu.org/software/parallel/)  | シェル上でコマンドを並列実行する
[multitail](https://www.vanheusden.com/multitail/)  | 複数ファイルをtail表示する
[taskwarrior](https://taskwarrior.org/)             | タスク管理ツール
[neomutt](https://neomutt.org/)                     | メールクライアント
[weechat](https://weechat.org/)                     | チャットクライアント
[Chat over SSH](https://github.com/shazow/ssh-chat) | ssh接続で使用できるクライアント不要のチャットサーバ
[fossil](https://www.fossil-scm.org/)               | チケット型プロジェクト管理ツール、兼バグトラッキングシステム、兼バージョン管理システム
[gnuplot](http://www.gnuplot.info/)                 | グラフ描画ソフト

### 依存ライブラリ

 項目                                              | 説明
---------------------------------------------------|------
[zlib](http://www.zlib.net/)                       | 
[bzip](https://bzip2.sourceforge.io/)              | 
[xz](https://tukaani.org/xz/)                      | 
[ncurses](https://www.gnu.org/software/ncurses/)   | 
[gettext](https://www.gnu.org/software/gettext/)   | 
[readline](https://www.gnu.org/software/readline/) | 
[expat](https://sourceforge.net/projects/expat/)   | 
[openssl](https://www.openssl.org/)                | 
[sqlite3](https://www.sqlite.org/)                 | 
[libffi](https://sourceware.org/libffi/)           | 
[libevent](http://libevent.org/)                   | 

### ビルド用ツール

 項目                                                              | 説明
-------------------------------------------------------------------|------
[pkgconfig](https://www.freedesktop.org/wiki/Software/pkg-config/) | 
[perl](https://www.cpan.org/src/README.html)                       | 
[m4](https://www.gnu.org/software/m4/)                             | 
[autoconf](https://www.gnu.org/software/autoconf/)                 | 
[automake](https://www.gnu.org/software/automake/)                 | 
[texinfo](https://www.gnu.org/software/textifo/)                   | 
