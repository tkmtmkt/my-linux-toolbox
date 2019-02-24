#!/bin/bash
# https://weechat.org/download/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.4
TARGET=weechat-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.xz
DOWNLOAD_URL=https://weechat.org/files/src/${TARGET}.tar.xz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL -o ${ARCHIVE} ${DOWNLOAD_URL}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_BUILD_TYPE=Release \
      -DENABLE_PERL=OFF \
      -DENABLE_PHP=OFF \
      -DENABLE_TCL=OFF \
      -DNCURSES_INCLUDE_PATH=${PREFIX}/include \
      .. &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
