#!/bin/bash
# https://gnupg.org/download/index.html
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.2.13
TARGET=gnupg-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.bz2
DOWNLOAD_URL=https://www.gnupg.org/ftp/gcrypt/gnupg/${TARGET}.tar.bz2
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
export LDFLAGS="${LDFLAGS} -lrt"
./configure --prefix=${PREFIX} \
            ac_cv_func_inotify_init=no \
            --enable-gpg-is-gpg2 \
            --with-tar=${PREFIX}/bin/tar \
            --with-libgpg-error-prefix=${PREFIX} \
            --with-libgcrypt-prefix=${PREFIX} \
            --with-libassuan-prefix=${PREFIX} \
            --with-ksba-prefix=${PREFIX} \
            --with-npth-prefix=${PREFIX} \
            --with-ntbtls-prefix=${PREFIX} \
            --with-zlib=${PREFIX} \
            --with-bzip2=${PREFIX} &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
