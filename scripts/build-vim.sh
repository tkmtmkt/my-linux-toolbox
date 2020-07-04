#!/bin/bash
# https://github.com/vim/vim/releases
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=8.2.1119
TARGET=vim-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=https://github.com/vim/vim/archive/v${VERSION}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

VIMDOC_JA=vimdoc-ja.tar.gz
[[ ! -s "${ARCHIVES_DIR}/${VIMDOC_JA}" ]] &&
  curl -ksSL https://github.com/vim-jp/vimdoc-ja/archive/master.tar.gz -o "${ARCHIVES_DIR}/${VIMDOC_JA}"

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
tar xf "${ARCHIVES_DIR}/${VIMDOC_JA}" &&
cp -p vimdoc-ja-master/doc/* runtime/doc/ &&
cp -p vimdoc-ja-master/syntax/* runtime/syntax/ &&

./configure --prefix=${PREFIX} \
            --with-features=huge \
            --enable-fail-if-missing \
            --enable-multibyte \
            --enable-python3interp \
            --enable-gpm \
            --enable-cscope \
            --enable-fontset &&
make && make install &&
ln -sf vim ${PREFIX}/bin/vi
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
