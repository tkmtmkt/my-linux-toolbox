#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

pushd $BUILD_DIR
TARGET=readline-7.0
ARCHIVE=$ARCH_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/readline/$TARGET.tar.gz
[[ ! -e $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL
[[ -e $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

#patches
for n in 001 002 003
do
  PATCH="readline70-$n"
  [[ ! -e "$ARCH_DIR/$PATCH" ]] && wget http://ftp.gnu.org/gnu/readline/readline-7.0-patches/$PATCH -O "$ARCH_DIR/$PATCH"
  [[ ! -e "$TARGET/$PATCH" ]] && cp "$ARCH_DIR/$PATCH" "$TARGET/$PATCH"
done

pushd $TARGET
patch -p0 < readline70-001 &&
patch -p0 < readline70-002 &&
patch -p0 < readline70-003 &&
./configure --prefix=$PREFIX \
            --enable-multibyte &&
make && make install
RESULT=$?
popd

popd

exit $RESULT