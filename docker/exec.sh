#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

case "$1" in
  centos[67]|ubuntu1[46]04)
    pushd $SCRIPT_DIR
    docker-compose run --rm $1 /bin/bash
    popd
    ;;
  *)
    echo "Usage: $0 [centos6|centos7|ubuntu1404|ubuntu1604]"
    ;;
esac
