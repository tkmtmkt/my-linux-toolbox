#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

case "$1" in
  centos[5-7]|ubuntu1604)
    pushd $SCRIPT_DIR
    docker-compose run --rm $1 /bin/bash
    popd
    ;;
  *)
    echo "Usage: $0 [centos5|centos6|centos7|ubuntu1604]"
    ;;
esac
