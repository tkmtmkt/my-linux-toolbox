#!/bin/bash
docker-compose run --rm centos5 /opt/toolbox/recipe/build.sh
docker-compose run --rm centos6 /opt/toolbox/recipe/build.sh
docker-compose run --rm centos7 /opt/toolbox/recipe/build.sh
