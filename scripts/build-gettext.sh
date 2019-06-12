#!/bin/bash
# https://ftp.gnu.org/gnu/gettext/?C=M;O=D
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=0.20.1
TARGET=gettext-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.xz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/gettext/${TARGET}.tar.xz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
-Wl,-rpath -Wl,LIBDIR
./configure --prefix=${PREFIX} \
            --with-libxml2-prefix=${PREFIX}/lib &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
