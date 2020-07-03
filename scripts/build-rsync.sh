#!/bin/bash
# https://download.samba.org/pub/rsync/src/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=3.2.1
TARGET=rsync-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://download.samba.org/pub/rsync/src/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}

# build
cd ${TARGET}
./configure --prefix=${PREFIX} \
            --disable-xxhash \
            --disable-zstd \
            --disable-lz4 &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
