#!/bin/bash
# https://gnupg.org/download/index.html
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=1.6
TARGET=npth-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.bz2
DOWNLOAD_URL=https://gnupg.org/ftp/gcrypt/npth/${TARGET}.tar.bz2
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
