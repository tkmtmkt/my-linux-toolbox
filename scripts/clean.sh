#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
WORKSPACE_DIR=$(dirname ${SCRIPT_DIR})
WORKSPACE_NAME=$(basename ${WORKSPACE_DIR})
TARGET_DIR=$(dirname ${WORKSPACE_DIR})

rm -rf ${WORKSPACE_DIR}/log/* \
       ${WORKSPACE_DIR}/build/

for DIR in $(ls ${TARGET_DIR})
do
  case ${DIR} in
    "${WORKSPACE_NAME}")
      ;;
    *)
      rm -rf ${TARGET_DIR}/${DIR}
      ;;
  esac
done
