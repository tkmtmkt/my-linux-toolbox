#!/bin/bash
# https://ftp.gnu.org/gnu/ncurses/?C=M;O=D
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

VERSION=6.2
TARGET=ncurses-${VERSION}

# download
ARCHIVE=${ARCHIVES_DIR}/${TARGET}.tar.gz
DOWNLOAD_URL=http://ftp.gnu.org/gnu/ncurses/${TARGET}.tar.gz
[[ ! -s ${ARCHIVE} ]] && curl -ksSL ${DOWNLOAD_URL} -o ${ARCHIVE}

pushd ${BUILD_DIR}

# expand
[[ -d ${TARGET} ]] && rm -rf ${TARGET}
tar xf ${ARCHIVE}
cd ${TARGET}

# build
export CPPFLAGS="-P"
./configure --prefix=${PREFIX} \
            --with-pkg-config=${PREFIX}/bin/pkg-config \
            --with-pkg-config-libdir=${PREFIX}/lib/pkgconfig \
            --with-shared \
            --without-debug \
            --without-manpages \
            --enable-pc-files \
            --enable-rpath \
            --enable-widec \
            --enable-ext-colors &&
make && make install &&
for lib in ncurses form panel menu
do
  ln -sf lib${lib}w.a    ${PREFIX}/lib/lib${lib}.a
  ln -sf lib${lib}w.so   ${PREFIX}/lib/lib${lib}.so
  ln -sf lib${lib}w.so.6 ${PREFIX}/lib/lib${lib}.so.6
  ln -sf ${lib}w.pc      ${PREFIX}/lib/pkgconfig/${lib}.pc
done
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
