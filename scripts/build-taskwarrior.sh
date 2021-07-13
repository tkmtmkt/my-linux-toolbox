#!/bin/bash
# https://taskwarrior.org/download/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.5.3
TARGET=task-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://taskwarrior.org/download/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
if [[ -n $(which scl_source 2> /dev/null) ]]; then
  source scl_source enable devtoolset-8
fi
cmake -DCMAKE_INSTALL_PREFIX=${PREFIX} \
      -DCMAKE_BUILD_TYPE=release \
      -DENABLE_SYNC=OFF \
      -DLANGUAGE=9 \
      . &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
