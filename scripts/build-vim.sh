#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=vim-8.1.0005

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/vim/vim/archive/v8.1.0005.tar.gz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

VIMDOC_JA=vimdoc-ja.tar.gz
[[ ! -s "$ARCHIVES_DIR/$VIMDOC_JA" ]] &&
  curl -ksSL https://github.com/vim-jp/vimdoc-ja/archive/master.tar.gz -o "$ARCHIVES_DIR/$VIMDOC_JA"

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

pushd $TARGET
tar xzf "$ARCHIVES_DIR/$VIMDOC_JA" &&
cp -p vimdoc-ja-master/doc/* runtime/doc/ &&
cp -p vimdoc-ja-master/syntax/* runtime/syntax/ &&

./configure --prefix=$PREFIX \
            --enable-fail-if-missing \
            --enable-python3interp=yes \
            --enable-multibyte \
            --with-features=huge &&
make && make install &&
ln -sf vim $PREFIX/bin/vi
RESULT=$?
popd

popd

exit $RESULT
