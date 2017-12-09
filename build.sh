#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)

$SCRIPT_DIR/scripts/build-all.sh > $SCRIPT_DIR/log/result-$(date +%Y%m%d%H%M).log 2>&1
