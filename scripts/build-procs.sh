#!/bin/bash
# https://github.com/dalance/procs/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=0.14.0
TARGET=procs-v${VERSION}-x86_64-linux

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.zip
DOWNLOAD_URL=https://github.com/dalance/procs/releases/download/v${VERSION}/${TARGET}.zip
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
unzip -d ${TARGET} ${ARCHIVE}

# build (download only)
mkdir -p ${PREFIX}/bin &&
cp -p ${TARGET}/procs ${PREFIX}/bin/
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
