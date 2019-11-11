#!/bin/bash
# https://julialang.org/downloads/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=1.2.0
TARGET=julia-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}-linux-x86_64.tar.gz
DOWNLOAD_URL=https://julialang-s3.julialang.org/bin/linux/x64/1.2/${TARGET}-linux-x86_64.tar.gz
if [[ ! -s ${ARCHIVE} ]]; then
  echo "curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}"
  curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}
fi

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}

# build
rsync -av ${TARGET}/ ${PREFIX}/
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
