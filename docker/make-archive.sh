#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

TARGET=toolbox

case "$1" in
  centos6|ubuntu1604)
    BASE_NAME=${TARGET}-$1
    PARENT_DIR=${SCRIPT_DIR}/$1/opt

    tar czf ${BASE_NAME}-$(date +%Y%m%d).tar.gz -C ${PARENT_DIR} \
        --exclude=${TARGET}/${BASE_NAME}-*.tar.gz \
        --exclude=${TARGET}/workspace \
        ${TARGET}
    ;;
  *)
    echo "Usage: $0 [centos6|ubuntu1604]"
    exit 1
    ;;
esac
