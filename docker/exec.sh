#!/bin/bash
SCRIPT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0});pwd)

export PREFIX=/opt/toolbox
export WORKSPACE=${PREFIX}/workspace
export HOST=$1

case "${HOST}" in
  centos)
    IMAGE=centos_toolbox:7.7.1908
    ;;
  ubuntu)
    IMAGE=ubuntu_toolbox:18.04
    ;;
  *)
    echo "Usage: $0 [centos|ubuntu]"
    exit 1
    ;;
esac

pushd ${SCRIPT_DIR} > /dev/null
#docker-compose run --rm $1 /bin/bash
[[ ! -d ${HOST}${PREFIX} ]] && mkdir -p ${HOST}${PREFIX}
podman run -it --rm -h ${HOST} \
  -v "./${HOST}${PREFIX}/:${PREFIX}/:rw" \
  -v "../scripts/:${WORKSPACE}/scripts/:rw" \
  -v "../archives/:${WORKSPACE}/archives/:rw" \
  ${IMAGE} /bin/bash
RESULT=$?
popd > /dev/null
exit ${RESULT}
