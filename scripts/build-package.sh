#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

WORKSPACE_DIR=$(dirname ${SCRIPT_DIR})
WORKSPACE=$(basename ${WORKSPACE_DIR})
TARGET_DIR=$(dirname ${WORKSPACE_DIR})
TARGET=$(basename ${TARGET_DIR})

chown $(id -u):$(id -g) ${TARGET_DIR}
for SUBDIR in $(find ${TARGET_DIR} -mindepth 1 -maxdepth 1)
do
  [[ "${SUBDIR}" != "${WORKSPACE_DIR}" ]] && chown -R $(id -u):$(id -g) ${SUBDIR}
done

ARCHIVE=${ARCHIVES_DIR}/${TARGET}$1-$(TZ='Asia/Tokyo' date +%Y%m%d).tar.gz
echo "package: ${ARCHIVE/${WORKSPACE_DIR}/..}"
tar czf ${ARCHIVE} -C $(dirname ${TARGET_DIR}) \
    --exclude=${TARGET}/${WORKSPACE} \
    ${TARGET}
