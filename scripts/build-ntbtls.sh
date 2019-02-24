#!/bin/bash
# https://gnupg.org/download/index.html
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=0.1.2
TARGET=ntbtls-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.bz2
DOWNLOAD_URL=https://gnupg.org/ftp/gcrypt/ntbtls/${TARGET}.tar.bz2
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
./configure --prefix=${PREFIX} \
            --with-libgpg-error-prefix=${PREFIX} \
            --with-libgcrypt-prefix=${PREFIX} \
            --with-ksba-prefix=${PREFIX} \
            --with-zlib=${PREFIX} &&
# CentOS6でのコンパイルエラー対処
sed -i -e '100 s|^typedef|//typedef|' src/context.h &&
sed -i -e '196 s|^typedef|//typedef|' src/ciphersuites.h &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
