#!/bin/bash
# https://sourceforge.net/projects/p7zip/files/p7zip/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=16.02
TARGET=p7zip_${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}_src_all.tar.bz2
DOWNLOAD_URL=https://sourceforge.net/projects/p7zip/files/p7zip/${VERSION}/${TARGET}_src_all.tar.bz2
[[ ! -s ${ARCHIVE} ]] && curl -ksSL -o ${ARCHIVE} ${DOWNLOAD_URL}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
sed -i "s|/usr/local|${PREFIX}|g" makefile.common &&
make all3 && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
