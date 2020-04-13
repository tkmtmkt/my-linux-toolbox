#!/bin/bash
# https://www.ruby-lang.org/ja/downloads/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.7
TARGET=ruby-${VERSION}.1

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.xz
DOWNLOAD_URL=https://cache.ruby-lang.org/pub/ruby/${VERSION}/${TARGET}.tar.xz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
./configure --prefix=${PREFIX} &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
