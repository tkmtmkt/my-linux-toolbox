#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
BASE_DIR=$(cd $SCRIPT_DIR/..;pwd)
LOG_DIR=$BASE_DIR/log

[[ ! -d "$LOG_DIR" ]] && mkdir $LOG_DIR

# base
$SCRIPT_DIR/build-pkgconfig.sh    > $LOG_DIR/result-pkgconfig-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-perl.sh         > $LOG_DIR/result-perl-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-m4.sh           > $LOG_DIR/result-m4-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-autoconf.sh     > $LOG_DIR/result-autoconf-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-automake.sh     > $LOG_DIR/result-automake-$(date +%Y%m%d%H%M).log 2>&1 &&

# library
$SCRIPT_DIR/build-zlib.sh         > $LOG_DIR/result-zlib-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-ncurses.sh      > $LOG_DIR/result-ncurses-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-gettext.sh      > $LOG_DIR/result-gettext-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-readline.sh     > $LOG_DIR/result-readline-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-bzip.sh         > $LOG_DIR/result-bzip-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-xz.sh           > $LOG_DIR/result-xz-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-expat.sh        > $LOG_DIR/result-expat-$(date +%Y%m%d%H%M).log 2>&1 &&

# util
$SCRIPT_DIR/build-openssl.sh      > $LOG_DIR/result-openssl-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-curl.sh         > $LOG_DIR/result-curl-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-tar.sh          > $LOG_DIR/result-tar-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-p7zip.sh        > $LOG_DIR/result-p7zip-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-highway.sh      > $LOG_DIR/result-highway-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-global.sh       > $LOG_DIR/result-global-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-sqlite3.sh      > $LOG_DIR/result-sqlite3-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-nkf.sh          > $LOG_DIR/result-nkf-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-jq.sh           > $LOG_DIR/result-jq-$(date +%Y%m%d%H%M).log 2>&1 &&

# vim
$SCRIPT_DIR/build-vim.sh          > $LOG_DIR/result-vim-$(date +%Y%m%d%H%M).log 2>&1 &&

# git
$SCRIPT_DIR/build-git.sh          > $LOG_DIR/result-git-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-tig.sh          > $LOG_DIR/result-tig-$(date +%Y%m%d%H%M).log 2>&1 &&

# tmux
$SCRIPT_DIR/build-libevent.sh     > $LOG_DIR/result-libevent-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-tmux.sh         > $LOG_DIR/result-tmux-$(date +%Y%m%d%H%M).log 2>&1 &&

# GnuPG
$SCRIPT_DIR/build-libgpg-error.sh > $LOG_DIR/result-libgpg-error-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-npth.sh         > $LOG_DIR/result-npth-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-libgcrypt.sh    > $LOG_DIR/result-libgcrypt-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-libksba.sh      > $LOG_DIR/result-libksba-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-libassuan.sh    > $LOG_DIR/result-libassuan-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-ntbtls.sh       > $LOG_DIR/result-ntbtls-$(date +%Y%m%d%H%M).log 2>&1 &&
$SCRIPT_DIR/build-gnupg.sh        > $LOG_DIR/result-gnupg-$(date +%Y%m%d%H%M).log 2>&1 &&

# language
$SCRIPT_DIR/build-python.sh       > $LOG_DIR/result-python-$(date +%Y%m%d%H%M).log 2>&1
