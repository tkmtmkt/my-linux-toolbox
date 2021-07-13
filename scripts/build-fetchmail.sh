#!/bin/bash
# https://www.fetchmail.info/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=6.4
TARGET=fetchmail-${VERSION}.19

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.xz
DOWNLOAD_URL=https://sourceforge.net/projects/fetchmail/files/branch_${VERSION}/${TARGET}.tar.xz/download
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
./configure --prefix=${PREFIX} \
            --with-ssl=${PREFIX} &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
