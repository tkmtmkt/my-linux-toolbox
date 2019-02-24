#!/bin/bash
# https://sourceforge.net/projects/bzip2/files/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=1.0.6
TARGET=bzip2-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://fossies.org/linux/misc/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
sed -i "s|CFLAGS=|CFLAGS=-fPIC |g" Makefile &&
make &&
make -f Makefile-libbz2_so &&
make install PREFIX=${PREFIX}
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
