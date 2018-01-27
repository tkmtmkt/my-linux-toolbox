#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=readline-7.0

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/readline/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && wget --no-check-certificate -O $ARCHIVE $DOWNLOAD_URL

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar zxf $ARCHIVE

# patches
for n in 001 002 003
do
  PATCH="readline70-$n"
  [[ ! -s "$ARCHIVES_DIR/$PATCH" ]] && wget http://ftp.gnu.org/gnu/readline/readline-7.0-patches/$PATCH -O "$ARCHIVES_DIR/$PATCH"
  [[ ! -s "$TARGET/$PATCH" ]] && cp "$ARCHIVES_DIR/$PATCH" "$TARGET/$PATCH"
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
