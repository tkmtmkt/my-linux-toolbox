#!/bin/bash
# https://ja.osdn.net/projects/nkf/releases/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.1.5
TARGET=nkf-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://ja.osdn.net/projects/nkf/downloads/70406/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
sed -i "s|/usr/local|${PREFIX}|g" Makefile &&
make && make install &&
sed -i "s|-jW||g" man/make_doc.sh &&
man/make_doc.sh && make install-man-ja
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
