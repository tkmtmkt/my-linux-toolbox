#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

TARGET=toolbox

case "$1" in
  centos|ubuntu)
    pushd ${SCRIPT_DIR}
    docker-compose run --rm $1 /opt/${TARGET}/workspace/scripts/build-all.sh
    RESULT=$?
    popd
    exit ${RESULT}
    ;;
  *)
    echo "Usage: $0 [centos|ubuntu]"
    ;;
esac
