#!/bin/bash
# https://github.com/neomutt/neomutt/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=20200626
TARGET=neomutt-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/neomutt-${VERSION}.tar.gz
DOWNLOAD_URL=https://github.com/neomutt/neomutt/archive/${VERSION}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
./configure --prefix=${PREFIX} \
            --with-ssl=${PREFIX} \
            --disable-doc \
            --disable-idn &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
