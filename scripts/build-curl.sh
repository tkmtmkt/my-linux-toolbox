#!/bin/bash
# https://curl.haxx.se/download.html
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=7.70.0
TARGET=curl-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.xz
DOWNLOAD_URL=https://curl.haxx.se/download/${TARGET}.tar.xz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

CA_CERT=${ARCHIVES_DIR}/cacert.pem
[[ ! -s ${CA_CERT} ]] && curl -ksSL http://curl.haxx.se/ca/cacert.pem -o ${CA_CERT}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
CA_PATH=${PREFIX}/ssl/certs
CA_BUNDLE=${CA_PATH}/ca-bundle.crt
cp ${CA_CERT} ${CA_BUNDLE}

./configure --prefix=${PREFIX} \
            --disable-manual \
            --enable-libcurl-option \
            --with-ssl=${PREFIX} \
            --with-ca-path=${CA_PATH} \
            --with-ca-bundle=${CA_BUNDLE} &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
