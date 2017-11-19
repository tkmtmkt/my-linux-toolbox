#!/bin/bash
#docker-compose run --rm centos5 /opt/toolbox/recipe/build.sh 2>&1 | tee build-centos5.log
docker-compose run --rm centos6 /opt/toolbox/recipe/build.sh 2>&1 | tee build-centos6.log
#docker-compose run --rm centos7 /opt/toolbox/recipe/build.sh 2>&1 | tee build-centos7.log
