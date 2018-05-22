#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

# python packages
if [[ -d "$ARCHIVES_DIR/wheels" ]]
then
  pip install --no-deps --no-index $(find $ARCHIVES_DIR/wheels -name pip-*)
  #
  pip install --no-deps --no-index -r $SCRIPT_DIR/requirements.txt -f $ARCHIVES_DIR/wheels
else
  pip install --upgrade pip wheel
  pip wheel pip wheel -w $ARCHIVES_DIR/wheels
  #
  pip install -r $SCRIPT_DIR/requirements.in.txt
  pip freeze > $SCRIPT_DIR/requirements.txt
  pip wheel -r $SCRIPT_DIR/requirements.txt -w $ARCHIVES_DIR/wheels
fi
