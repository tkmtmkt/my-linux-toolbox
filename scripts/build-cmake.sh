#!/bin/bash
# https://cmake.org/download/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=3.24.1
TARGET=cmake-${VERSION}-linux-x86_64

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/Kitware/CMake/releases/download/v${VERSION}/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -e ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}

# build (download only)
mkdir -p ${PREFIX_BUILDTOOL}/
cp -rp ${TARGET}/* ${PREFIX_BUILDTOOL}/
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
