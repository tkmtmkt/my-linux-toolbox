#!/bin/bash
# https://github.com/bazelbuild/bazel/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=4.2.2
TARGET=bazel-${VERSION}-linux-x86_64

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}
DOWNLOAD_URL=https://github.com/bazelbuild/bazel/releases/download/${VERSION}/${TARGET}
if [[ ! -s ${ARCHIVE} ]]; then
  echo "curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}"
  curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}
fi

pushd ${BUILD_DIR}

# expand

# build (download only)
cp -p ${ARCHIVE} ${PREFIX}/bin/bazel &&
chmod a+x ${PREFIX}/bin/bazel
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
