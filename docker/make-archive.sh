#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

case "$1" in
  centos[67]|ubuntu1[46]04)
    BASE_NAME=toolbox-$1
    PARENT_DIR=$SCRIPT_DIR/$1/opt

    tar czf $BASE_NAME-$(date +%Y%m%d).tar.gz -C $PARENT_DIR \
        --exclude=toolbox/$BASE_NAME-*.tar.gz \
        --exclude=toolbox/workspace \
        toolbox
    ;;
  *)
    echo "Usage: $0 [centos6|centos7|ubuntu1404|ubuntu1604]"
    exit 1
    ;;
esac
