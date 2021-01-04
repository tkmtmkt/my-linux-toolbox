#!/bin/bash
# http://www.lua.org/ftp/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=5.4.2
TARGET=lua-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=http://www.lua.org/ftp/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
sed -i -e "s|INSTALL_TOP=.*|INSTALL_TOP= ${PREFIX}|g" Makefile &&
sed -i -e "s|MYLDFLAGS=.*|MYLDFLAGS= -L${PREFIX}/lib -Wl,-rpath,${PREFIX}/lib|g" \
       -e "s|MYLIBS=.*|MYLIBS= -lncursesw|g" src/Makefile &&
make linux && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
