#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

export PREFIX=/opt/toolbox
export WORKSPACE=workspace

case "$1" in
  centos|ubuntu)
    pushd ${SCRIPT_DIR}
    docker-compose run --rm $1 /bin/bash
    RESULT=$?
    popd
    exit ${RESULT}
    ;;
  *)
    echo "Usage: $0 [centos|ubuntu]"
    exit 1
    ;;
esac
