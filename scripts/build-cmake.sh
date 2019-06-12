#!/bin/bash
# https://cmake.org/download/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=3.14.5
TARGET=cmake-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}-linux-x64-${VERSION}.tar.gz
DOWNLOAD_URL=https://github.com/Kitware/CMake/releases/download/v${VERSION}/${TARGET}-Linux-x86_64.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -e ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}

cp -rp ${TARGET}-Linux-x86_64/* ${PREFIX}/
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
