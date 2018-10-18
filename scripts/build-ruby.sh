#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

TARGET=ruby-2.4.3
#TARGET=ruby-2.5.0

# download
ARCHIVE=$ARCHIVES_DIR/$TARGET.tar.gz
DOWNLOAD_URL=https://cache.ruby-lang.org/pub/ruby/2.4/$TARGET.tar.gz
#DOWNLOAD_URL=https://cache.ruby-lang.org/pub/ruby/2.5/$TARGET.tar.gz
[[ ! -s $ARCHIVE ]] && curl -ksSL $DOWNLOAD_URL -o $ARCHIVE

BUNDLER_GEM=bundler-1.16.1.gem
[[ ! -s $ARCHIVES_DIR/$BUNDLER_GEM ]] &&
  curl -ksSL https://rubygems.org/downloads/$BUNDLER_GEM -o $ARCHIVES_DIR/$BUNDLER_GEM

# build
pushd $BUILD_DIR
[[ -d $TARGET ]] && rm -rf $TARGET
tar xf $ARCHIVE

pushd $TARGET
./configure --prefix=$PREFIX &&
make && make install &&
gem install $ARCHIVES_DIR/$BUNDLER_GEM
RESULT=$?
popd

popd

log $TARGET
exit $RESULT
