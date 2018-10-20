#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

VERSION=0.43
TARGET=rlwrap-$VERSION

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://github.com/hanslub42/rlwrap/releases/download/v$VERSION/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

RLWRAP_EXT=rlwrap-extensions-V12-0.05.tar.gz
[[ ! -s "$ARCHIVES_DIR/$RLWRAP_EXT" ]] &&
  curl -ksSL http://www.linuxification.at/download/$RLWRAP_EXT -o "$ARCHIVES_DIR/$RLWRAP_EXT"

pushd $BUILD_DIR

# expand
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE
cd $TARGET

# build
./configure --prefix=$PREFIX &&
make && make install
RESULT=$?

popd

# completions for Oracle
if [[ $RESULT -eq 0 ]]; then
  pushd $PREFIX/share/rlwrap/completions
  tar xf "$ARCHIVES_DIR/$RLWRAP_EXT"
  for CMD in asm+ sql+
  do
    sed -i "s|/usr/local|$PREFIX|g" $CMD
    mv $CMD $PREFIX/bin
  done
  popd
fi

log $TARGET
exit $RESULT
