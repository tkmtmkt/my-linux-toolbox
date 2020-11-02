#!/bin/bash
# https://github.com/direnv/direnv/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.23.1
TARGET=direnv

# download
case $(uname -m) in
  x86_64)
    ARCHIVE=${ARCHIVES_DIR}/${TARGET}.linux-amd64
    DOWNLOAD_URL=https://github.com/direnv/direnv/releases/download/v${VERSION}/${TARGET}.linux-amd64
    ;;
  aarch64)
    ARCHIVE=${ARCHIVES_DIR}/${TARGET}.linux-arm
    DOWNLOAD_URL=https://github.com/direnv/direnv/releases/download/v${VERSION}/${TARGET}.linux-arm
    ;;
esac
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand

# build (download only)
cp ${ARCHIVE} ${PREFIX}/bin/${TARGET} &&
chmod a+x ${PREFIX}/bin/${TARGET}
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
