#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0);pwd)
source $SCRIPT_DIR/build-common.sh

WHEELS_DIR=$ARCHIVES_DIR/wheels

pushd $BUILD_DIR

# python packages
if [[ "$OFFLINE" = "yes" ]]
then
  # offline install (pip & wheel)
  pip3 install --no-deps --no-index $(find $WHEELS_DIR -name pip-* -o -name wheel-*) &&

  # offline install (other)
  pip3 install --no-deps --no-index -f $WHEELS_DIR -r $SCRIPT_DIR/requirements.txt
else
  # online install (pip & wheel)
  pip3 install --upgrade pip wheel &&

  # online install (other)
  pip3 install -r $SCRIPT_DIR/requirements.in.txt &&
  pip3 install Cartopy Shapely &&
  pip3 freeze > $SCRIPT_DIR/requirements.txt &&

  # download packages -> wheels directory
  if [[ -d $WHEELS_DIR ]]; then rm -rf $WHEELS_DIR; fi &&
  pip3 wheel -w $WHEELS_DIR pip wheel &&
  pip3 wheel -w $WHEELS_DIR -r $SCRIPT_DIR/requirements.txt &&

  # TODO: Provisional action until supervisor version 4 is released.
  pip3 install git+https://github.com/Supervisor/supervisor &&
  pip3 freeze > $SCRIPT_DIR/requirements.txt &&
  # make wheel
  # refs:  https://stackoverflow.com/questions/19796883/supervisord-for-python-3
  TARGET=$BUILD_DIR/supervisor &&
  if [[ -d $TARGET ]]; then rm -rf $TARGET; fi &&
  git clone https://github.com/Supervisor/supervisor.git $TARGET &&
  cd $TARGET &&
  python setup.py bdist_wheel &&
  cp -p $TARGET/dist/supervisor-*.whl $WHEELS_DIR
fi
RESULT=$?

popd

log $TARGET
exit $RESULT
