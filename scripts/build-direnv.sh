#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.19.0
TARGET=direnv

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.linux-amd64
DOWNLOAD_URL=https://github.com/direnv/direnv/releases/download/v${VERSION}/${TARGET}.linux-amd64
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand

# build
cp ${ARCHIVE} ${PREFIX}/bin/${TARGET} &&
chmod a+x ${PREFIX}/bin/${TARGET}
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
