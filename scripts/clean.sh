#!/usr/bin/env bash
set -o errexit
set -o errtrace
set -o nounset
set -o pipefail

SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
WORKSPACE_DIR=$(dirname ${SCRIPT_DIR})
TARGET_DIR=$(dirname ${WORKSPACE_DIR})

rm -rf ${WORKSPACE_DIR}/log/* \
       ${WORKSPACE_DIR}/build/
rm -rf ${TARGET_DIR}/BUILDLOG \
       ${TARGET_DIR}/bin \
       ${TARGET_DIR}/buildtool \
       ${TARGET_DIR}/etc/ \
       ${TARGET_DIR}/include/ \
       ${TARGET_DIR}/lib/ \
       ${TARGET_DIR}/libexec/ \
       ${TARGET_DIR}/man/ \
       ${TARGET_DIR}/sbin/ \
       ${TARGET_DIR}/share/ \
       ${TARGET_DIR}/ssl/ \
       ${TARGET_DIR}/var/
