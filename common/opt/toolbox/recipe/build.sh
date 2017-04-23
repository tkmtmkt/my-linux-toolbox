#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

$SCRIPT_DIR/build-pkgconfig.sh
$SCRIPT_DIR/build-perl.sh
$SCRIPT_DIR/build-m4.sh
$SCRIPT_DIR/build-autoconf.sh
$SCRIPT_DIR/build-automake.sh

# archive library
$SCRIPT_DIR/build-zlib.sh
$SCRIPT_DIR/build-bzip.sh
$SCRIPT_DIR/build-xz.sh

$SCRIPT_DIR/build-tar.sh

# vim
$SCRIPT_DIR/build-ncurses.sh
$SCRIPT_DIR/build-vim.sh

# git
$SCRIPT_DIR/build-gettext.sh
$SCRIPT_DIR/build-expat.sh
$SCRIPT_DIR/build-openssl.sh
$SCRIPT_DIR/build-curl.sh
$SCRIPT_DIR/build-git.sh
$SCRIPT_DIR/build-tig.sh

# GnuPG
$SCRIPT_DIR/build-libgpg-error.sh
$SCRIPT_DIR/build-libgcrypt.sh
$SCRIPT_DIR/build-libassuan.sh
$SCRIPT_DIR/build-libksba.sh
$SCRIPT_DIR/build-pth.sh
$SCRIPT_DIR/build-gnupg.sh

# tmux
$SCRIPT_DIR/build-libevent.sh
$SCRIPT_DIR/build-tmux.sh

# other utils
$SCRIPT_DIR/build-highway.sh
$SCRIPT_DIR/build-global.sh
$SCRIPT_DIR/build-p7zip.sh
$SCRIPT_DIR/build-nkf.sh
