#!/bin/bash
# https://github.com/openssl/openssl/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=3.1.0
TARGET=openssl-${VERSION}
VERSION=1_1_1t
TARGET=OpenSSL_${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/openssl/openssl/archive/refs/tags/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL -o ${ARCHIVE} ${DOWNLOAD_URL}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd openssl-${TARGET}

# build
PERL=${PREFIX_BUILDTOOL}/bin/perl
./config zlib \
         --prefix=${PREFIX} \
         --openssldir=${PREFIX}/ssl \
         --with-zlib-include=${PREFIX}/include \
         --with-zlib-lib=${PREFIX}/lib \
         -Wl,-rpath,${PREFIX}/lib &&
make &&
make install_sw &&
make install_ssldirs &&
make install_man_docs
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
