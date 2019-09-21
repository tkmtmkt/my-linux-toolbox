#!/bin/bash
# https://github.com/monochromegane/the_platinum_searcher/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.2.0
TARGET=pt_linux_amd64

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/monochromegane/the_platinum_searcher/releases/download/v${VERSION}/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
tar xf ${ARCHIVE}

# build
cp -p ${TARGET}/pt ${PREFIX}/bin/pt &&
chmod a+x ${PREFIX}/bin/pt
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
