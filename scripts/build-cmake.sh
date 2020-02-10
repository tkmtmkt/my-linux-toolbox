#!/bin/bash
# https://cmake.org/download/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=3.16.2
TARGET=cmake-${VERSION}-Linux-x86_64

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/Kitware/CMake/releases/download/v${VERSION}/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -e ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}

# build (download only)
cp -rp ${TARGET}/* ${PREFIX}/
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
