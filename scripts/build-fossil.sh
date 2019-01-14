#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.7
TARGET=fossil

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}-linux-x64-${VERSION}.tar.gz
DOWNLOAD_URL=http://www.fossil-scm.org/index.html/uv/${TARGET}-linux-x64-${VERSION}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -e ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE} &&
cp ./fossil ${PREFIX}/bin/
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
