#!/bin/bash
# https://github.com/axboe/fio/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=3.34
TARGET=fio-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/axboe/fio/archive/refs/tags/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd fio-${TARGET}

# build
./configure --prefix=${PREFIX} &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
