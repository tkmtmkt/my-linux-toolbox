#!/bin/bash
# https://github.com/git/git/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.26.2
TARGET=git-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/git/git/archive/v${VERSION}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
make configure &&
./configure --prefix=${PREFIX} \
            --with-zlib=${PREFIX}/lib \
            --with-perl=${PREFIX}/bin/perl \
            --with-tcltk=no &&
make all &&
make install &&
cp -rp ./contrib ${PREFIX}/share/git-core/
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
