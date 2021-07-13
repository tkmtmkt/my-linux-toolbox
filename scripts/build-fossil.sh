#!/bin/bash
# https://www.fossil-scm.org/home/uv/download.html
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.16
TARGET=fossil

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}-linux-x64-${VERSION}.tar.gz
DOWNLOAD_URL=https://www.fossil-scm.org/home/uv/${TARGET}-linux-x64-${VERSION}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
tar xf ${ARCHIVE}

# build (download only)
cp -p ${TARGET} ${PREFIX}/bin/${TARGET} &&
chmod a+x ${PREFIX}/bin/${TARGET}
RESULT=$?

popd

log ${TARGET}-${VERSION}
exit ${RESULT}
