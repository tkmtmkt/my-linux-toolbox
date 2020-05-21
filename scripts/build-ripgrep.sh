#!/bin/bash
# https://github.com/BurntSushi/ripgrep/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=12.1.0
case $(uname -m) in
  x86_64)
    TARGET=ripgrep-${VERSION}-x86_64-unknown-linux-musl
    ;;
  aarch64)
    TARGET=ripgrep-${VERSION}-arm-unknown-linux-gnueabihf
    ;;
esac

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/BurntSushi/ripgrep/releases/download/${VERSION}/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
tar xf ${ARCHIVE}

# build (download only)
cp -p ${TARGET}/rg ${PREFIX}/bin/rg &&
chmod a+x ${PREFIX}/bin/rg
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
