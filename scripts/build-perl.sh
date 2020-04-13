#!/bin/bash
# https://www.cpan.org/src/README.html
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=5.30.2
TARGET=perl-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=http://www.cpan.org/src/5.0/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL -o ${ARCHIVE} ${DOWNLOAD_URL}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
./Configure -des -Dprefix=${PREFIX} &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
