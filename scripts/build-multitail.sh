#!/bin/bash
# https://github.com/halturin/multitail
# https://www.vanheusden.com/multitail/download.php
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=6.5.0
TARGET=multitail-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://www.vanheusden.com/multitail/${TARGET}.tgz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
sed -i -e "s|PREFIX=/usr/local|PREFIX=${PREFIX}|g" Makefile &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
