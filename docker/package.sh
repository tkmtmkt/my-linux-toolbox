#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

export PREFIX=/opt/toolbox
export WORKSPACE=workspace

case "$1" in
  centos|ubuntu)
    pushd ${SCRIPT_DIR} > /dev/null
    docker-compose run --rm $1 ${PREFIX}/${WORKSPACE}/scripts/build-package.sh "-sysadm-$1"
    RESULT=$?
    popd > /dev/null
    exit ${RESULT}
    ;;
  *)
    echo "Usage: $0 [centos|ubuntu]"
    exit 1
    ;;
esac
