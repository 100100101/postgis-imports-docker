#!/bin/bash
source ../.env
RUN_NAME=gdal_run_name

# docker run --name $RUN_NAME --rm -it osgeo/gdal bash -c "echo 'test' && sleep 10000"

docker run --rm -it osgeo/gdal bash -c "echo 'test' && sleep 10000"
