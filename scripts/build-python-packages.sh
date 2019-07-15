#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)
source ${SCRIPT_DIR}/build-common.sh

TARGET=python-packages

WHEELS_DIR=${ARCHIVES_DIR}/wheels

pushd ${SCRIPT_DIR}

# python packages
if [[ "${OFFLINE}" = "yes" ]]
then
  # offline install (pip & wheel)
  pip3 install --no-deps --no-index $(find ${WHEELS_DIR} -name pip-* -o -name wheel-*) &&

  # offline install (other)
  pip3 install --no-deps --no-index -f ${WHEELS_DIR} -r ${SCRIPT_DIR}/requirements.txt
else
  # online install (pip & wheel & pipenv)
  pip3 install --upgrade pip wheel pipenv &&

  # online install (other)
  pipenv lock &&
  pipenv install --system &&
  pip3 freeze > ${SCRIPT_DIR}/requirements.txt &&

  # download packages -> wheels directory
  if [[ -d ${WHEELS_DIR} ]]; then rm -rf ${WHEELS_DIR}; fi &&
  pip3 wheel -w ${WHEELS_DIR} pip wheel &&
  pip3 wheel -w ${WHEELS_DIR} -r ${SCRIPT_DIR}/requirements.txt
fi
RESULT=$?

popd

log ${TARGET}
exit ${RESULT}
