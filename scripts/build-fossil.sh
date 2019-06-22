#!/bin/bash
# https://www.fossil-scm.org/home/uv/download.html
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.8
TARGET=fossil

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}-src-${VERSION}.tar.gz
DOWNLOAD_URL=https://www.fossil-scm.org/home/uv/${TARGET}-src-${VERSION}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -e ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}-${VERSION}

# build
./configure --prefix=${PREFIX} &&
make && make install
RESULT=$?

popd

log ${TARGET}-${VERSION}
exit ${RESULT}
