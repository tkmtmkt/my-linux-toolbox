#!/bin/bash
export PREFIX=/opt/toolbox
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export LD_LIBRARY_PATH=$PREFIX/lib
export PATH=$PREFIX/bin:$PATH

export ARCH_DIR=$PREFIX/arch
[[ ! -e $ARCH_DIR ]] && mkdir -p $ARCH_DIR

export BUILD_DIR=$PREFIX/build
[[ ! -e $BUILD_DIR ]] && mkdir -p $BUILD_DIR
