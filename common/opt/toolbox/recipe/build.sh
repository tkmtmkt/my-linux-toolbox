#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

$SCRIPT_DIR/build-m4.sh
$SCRIPT_DIR/build-autoconf.sh
$SCRIPT_DIR/build-ncurses.sh
$SCRIPT_DIR/build-vim.sh
