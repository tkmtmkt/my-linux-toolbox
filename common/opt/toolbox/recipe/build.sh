#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

$SCRIPT_DIR/build-m4.sh
$SCRIPT_DIR/build-autoconf.sh
$SCRIPT_DIR/build-automake.sh

$SCRIPT_DIR/build-tar.sh

$SCRIPT_DIR/build-ncurses.sh
$SCRIPT_DIR/build-vim.sh

$SCRIPT_DIR/build-expat.sh
$SCRIPT_DIR/build-zlib.sh
$SCRIPT_DIR/build-gettext.sh
$SCRIPT_DIR/build-perl.sh
$SCRIPT_DIR/build-openssl.sh
$SCRIPT_DIR/build-git.sh

$SCRIPT_DIR/build-libevent.sh
$SCRIPT_DIR/build-tmux.sh

$SCRIPT_DIR/build-nkf.sh
$SCRIPT_DIR/build-p7zip.sh
