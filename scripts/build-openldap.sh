#!/bin/bash
# https://www.openldap.org/software/download/OpenLDAP/openldap-release
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=2.4.59
VERSION=2.6.3
TARGET=openldap-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tgz
DOWNLOAD_URL=https://www.openldap.org/software/download/OpenLDAP/openldap-release/${TARGET}.tgz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL -o ${ARCHIVE} ${DOWNLOAD_URL}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
./configure --prefix=${PREFIX} \
            --disable-bdb \
            --disable-hdb &&
make depend &&
make && make install
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
