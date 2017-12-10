#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

pushd $SCRIPT_DIR
case "$1" in
  centos[5-7]|ubuntu1604)
    docker-compose run --rm $1 /usr/local/toolbox/scripts/build-all.sh
    ;;
  *)
    echo "Usage: $0 [centos5|centos6|centos7|ubuntu1604]"
    ;;
esac
popd
