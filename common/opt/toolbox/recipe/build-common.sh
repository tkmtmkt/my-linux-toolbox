#!/bin/bash
export PREFIX=/opt/toolbox
export PKG_CONFIG=$PREFIX/bin/pkg-config
export PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export PATH=$PREFIX/bin:$PATH
export MANPATH=$PREFIX/man:

export ARCH_DIR=$PREFIX/arch
[[ ! -e $ARCH_DIR ]] && mkdir -p $ARCH_DIR

export BUILD_DIR=$PREFIX/build
[[ ! -e $BUILD_DIR ]] && mkdir -p $BUILD_DIR
