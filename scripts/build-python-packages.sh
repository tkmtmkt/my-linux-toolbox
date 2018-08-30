#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

# python packages
if [[ "$OFFLINE" = "yes" ]]
then
  # offline install (pip & wheel)
  pip3 install --no-deps --no-index $(find $ARCHIVES_DIR/wheels -name pip-* -o -name wheel-*)

  # offline install (other)
  pip3 install --no-deps --no-index -r $SCRIPT_DIR/requirements.txt -f $ARCHIVES_DIR/wheels

  # TODO: Provisional action until supervisor version 4 is released.
  pip3 install --no-deps --no-index -f $(find ARCHIVES_DIR/wheels -name supervisor-*)
else
  # online install (pip & wheel)
  pip3 install --upgrade pip wheel
  pip3 wheel pip wheel -w $ARCHIVES_DIR/wheels

  # online install (other)
  pip3 install -r $SCRIPT_DIR/requirements.in.txt

  # download packages -> wheels directory
  pip3 freeze > $SCRIPT_DIR/requirements.txt
  pip3 wheel -r $SCRIPT_DIR/requirements.txt -w $ARCHIVES_DIR/wheels

  # TODO: Provisional action until supervisor version 4 is released.
  pip3 install git+https://github.com/Supervisor/supervisor
  # make wheel
  # git clone https://github.com/Supervisor/supervisor.git
  # cd supervisor
  # python setup.py bdist_wheel
  #https://stackoverflow.com/questions/19796883/supervisord-for-python-3
fi
