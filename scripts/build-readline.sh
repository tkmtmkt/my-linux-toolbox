#!/bin/bash
# https://ftp.gnu.org/gnu/readline/?C=M;O=D
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=8.1.2
TARGET=readline-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/readline/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL -o ${ARCHIVE} ${DOWNLOAD_URL}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
./configure --prefix=${PREFIX} \
            --enable-multibyte &&
make SHLIB_LIBS=-ltinfo && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
