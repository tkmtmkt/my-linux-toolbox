#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=readline-7.0

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/readline/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -ksSL -o $ARCHIVE $DOWNLOAD_URL

for n in 001 002 003
do
  PATCH="readline70-$n"
  [[ ! -s "$ARCHIVES_DIR/$PATCH" ]] &&
    curl -ksSL  http://ftp.gnu.org/gnu/readline/readline-7.0-patches/$PATCH -o "$ARCHIVES_DIR/$PATCH"
done

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE

pushd $TARGET
for n in 001 002 003
do
  patch -p0 < $ARCHIVES_DIR/readline70-$n
done &&
./configure --prefix=$PREFIX \
            --enable-multibyte &&
make && make install
RESULT=$?
popd

popd

exit $RESULT
