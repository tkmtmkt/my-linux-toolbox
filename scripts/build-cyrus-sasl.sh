#!/bin/bash
# https://github.com/cyrusimap/cyrus-sasl/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.1.28
TARGET=cyrus-sasl-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/cyrusimap/cyrus-sasl/releases/download/${TARGET}/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL -o ${ARCHIVE} ${DOWNLOAD_URL}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
./configure --prefix=${PREFIX} \
            --sysconfdir=${PREFIX}/etc \
            --enable-auth-sasldb \
            --with-dbpath=/var/lib/sasl/sasldb2 \
            --with-saslauthd=/var/run/saslauthd &&
make &&
make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
