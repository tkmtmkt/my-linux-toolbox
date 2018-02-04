#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

case "$1" in
  centos[67]|ubuntu1604)
    pushd $SCRIPT_DIR
    docker-compose run --rm $1 /opt/toolbox/workspace/scripts/build-all.sh
    popd
    ;;
  *)
    echo "Usage: $0 [centos5|centos6|centos7|ubuntu1604]"
    ;;
esac
