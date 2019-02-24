#!/bin/bash
# https://github.com/tkengo/highway/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=1.1.0
TARGET=highway-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/tkengo/highway/archive/v${VERSION}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
mkdir -p config
aclocal &&
autoconf &&
autoheader &&
automake --add-missing &&
./configure --prefix=${PREFIX} &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
