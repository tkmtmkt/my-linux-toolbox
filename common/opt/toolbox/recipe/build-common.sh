#!/bin/bash
export PREFIX=/opt/toolbox
export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"
export LD_LIBRARY_PATH=$PREFIX/lib
PATH=$PREFIX/bin:$PATH

export SRC_DIR=$PREFIX/src
[[ ! -e $SRC_DIR ]] && mkdir -p $SRC_DIR

export BUILD_DIR=$PREFIX/build
[[ ! -e $BUILD_DIR ]] && mkdir -p $BUILD_DIR
