#!/bin/bash
# https://julialang.org/downloads/
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=1.6
TARGET=julia-${VERSION}.1

# download
case $(uname -m) in
  x86_64)
    ARCHIVE=${ARCHIVES_DIR}/${TARGET}-linux-x86_64.tar.gz
    DOWNLOAD_URL=https://julialang-s3.julialang.org/bin/linux/x64/${VERSION}/${TARGET}-linux-x86_64.tar.gz
    ;;
  aarch64)
    ARCHIVE=${ARCHIVES_DIR}/${TARGET}-linux-aarch64.tar.gz
    DOWNLOAD_URL=https://julialang-s3.julialang.org/bin/linux/aarch64/${VERSION}/${TARGET}-linux-aarch64.tar.gz
    ;;
esac
if [[ ! -s ${ARCHIVE} ]]; then
  echo "curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}"
  curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}
fi

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}

# build (download only)
rsync -av ${TARGET}/ ${PREFIX}/
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
