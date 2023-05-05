#!/bin/bash
# https://sevenzip.osdn.jp/download.html
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2201
TARGET=7z${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}-linux-x64.tar.xz
DOWNLOAD_URL=https://www.7-zip.org/a/${TARGET}-linux-x64.tar.xz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL -o ${ARCHIVE} ${DOWNLOAD_URL}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
mkdir ${TARGET}
tar xf ${ARCHIVE} -C ${TARGET}

# build (download only)
cp -rp ${TARGET}/7zzs ${PREFIX}/bin/7z
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
