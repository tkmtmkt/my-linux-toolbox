#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

VERSION=2.4
TARGET=ruby-$VERSION.5
#VERSION=2.6
#TARGET=ruby-$VERSION.0

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.xz
DOWNLOAD_URL=https://cache.ruby-lang.org/pub/ruby/$VERSION/$TARGET.tar.xz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

BUNDLER_GEM=bundler-1.16.6.gem
[[ ! -s $ARCHIVES_DIR/$BUNDLER_GEM ]] &&
  curl -ksSL https://rubygems.org/downloads/$BUNDLER_GEM -o $ARCHIVES_DIR/$BUNDLER_GEM

pushd $BUILD_DIR

# expand
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE
cd $TARGET

# build
./configure --prefix=$PREFIX &&
make && make install &&
gem install $ARCHIVES_DIR/$BUNDLER_GEM
RESULT=$?

popd

log $TARGET
exit $RESULT
