#!/bin/bash
# https://github.com/ogham/exa/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=0.10.1
TARGET=exa-linux-x86_64-musl-v${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.zip
DOWNLOAD_URL=https://github.com/ogham/exa/releases/download/v${VERSION}/${TARGET}.zip
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
unzip -d ${TARGET} ${ARCHIVE}

# build (download only)
mkdir -p ${PREFIX}/{bin,completion} &&
mkdir -p ${PREFIX}/man/man{1,5} &&
cp -p ${TARGET}/bin/exa          ${PREFIX}/bin/ &&
cp -p ${TARGET}/man/exa.1        ${PREFIX}/man/man1/ &&
cp -p ${TARGET}/man/exa_colors.5 ${PREFIX}/man/man5/ &&
cp -p ${TARGET}/completions/*    ${PREFIX}/completion/
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
