#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
BASE_DIR=$(cd $SCRIPT_DIR/..;pwd)

export LANG=C
export PREFIX=$(cd $BASE_DIR/..;pwd)
export PKG_CONFIG=$PREFIX/bin/pkg-config
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export PATH=$PREFIX/bin:$PATH
export MANPATH=$PREFIX/man:

export ARCH_DIR=$BASE_DIR/arch
[[ ! -e $ARCH_DIR ]] && mkdir -p $ARCH_DIR

export BUILD_DIR=$BASE_DIR/build
[[ ! -e $BUILD_DIR ]] && mkdir -p $BUILD_DIR
