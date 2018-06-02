#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

# python packages
if [[ -d "$ARCHIVES_DIR/wheels" ]]
then
  # offline install (pip & wheel)
  pip install --no-deps --no-index $(find $ARCHIVES_DIR/wheels -name pip-* -o -name wheel-*)
  # offline install (other)
  pip install --no-deps --no-index -r $SCRIPT_DIR/requirements.txt -f $ARCHIVES_DIR/wheels
else
  # online install (pip & wheel)
  pip install --upgrade pip wheel
  pip wheel pip wheel -w $ARCHIVES_DIR/wheels
  # online install (other)
  pip install -r $SCRIPT_DIR/requirements.in.txt
  # download packages -> wheels directory
  pip freeze > $SCRIPT_DIR/requirements.txt
  pip wheel -r $SCRIPT_DIR/requirements.txt -w $ARCHIVES_DIR/wheels
fi
