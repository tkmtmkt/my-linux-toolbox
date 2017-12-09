SCRIPT_DIR=$(cd $(dirname $0);pwd)

docker-compose run --rm ubuntu1604 /usr/local/toolbox/scripts/build-all.sh > $SCRIPT_DIR/result-$(date +%Y%m%d%H%M).log 2>&1
