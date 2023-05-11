#!/bin/bash
# https://github.com/sharkdp/fd/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=8.7.0
TARGET=fd-v${VERSION}-x86_64-unknown-linux-musl

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/sharkdp/fd/releases/download/v${VERSION}/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}

# build (download only)
mkdir -p ${PREFIX}/{bin,completion} &&
mkdir -p ${PREFIX}/man/man1 &&
cp -p ${TARGET}/fd             ${PREFIX}/bin/ &&
cp -p ${TARGET}/fd.1           ${PREFIX}/man/man1/ &&
cp -p ${TARGET}/autocomplete/* ${PREFIX}/completion/
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
