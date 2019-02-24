#!/bin/bash
# https://pkg-config.freedesktop.org/releases/?C=M;O=D
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=0.29.2
TARGET=pkg-config-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=http://pkg-config.freedesktop.org/releases/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL -o ${ARCHIVE} ${DOWNLOAD_URL}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
./configure --prefix=${PREFIX_BUILDTOOL} \
            --with-internal-glib \
            --disable-compile-warnings \
            --disable-host-tool &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
