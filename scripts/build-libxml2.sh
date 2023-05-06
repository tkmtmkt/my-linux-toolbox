#!/bin/bash
# http://xmlsoft.org/downloads.html
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.10
TARGET=libxml2-${VERSION}.4

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.xz
DOWNLOAD_URL=https://download.gnome.org/sources/libxml2/${VERSION}/${TARGET}.tar.xz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
./configure --prefix=${PREFIX} \
            --with-history \
            --with-icu \
            --without-python &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
