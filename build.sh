#!/bin/bash
#docker-compose run --rm centos5 /opt/toolbox/recipe/build.sh > build-centos5.log 2>&1
docker-compose run --rm centos6 /opt/toolbox/recipe/build.sh > build-centos6.log 2>&1
#docker-compose run --rm centos7 /opt/toolbox/recipe/build.sh > build-centos7.log 2>&1
