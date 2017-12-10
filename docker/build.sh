#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

if [[ -z "$1" || ! -d "$SCRIPT_DIR/$1" ]]; then
  echo "usage: $0 {container_name}"
  exit 1
fi

docker-compose run --rm $1 /usr/local/toolbox/scripts/build-all.sh
