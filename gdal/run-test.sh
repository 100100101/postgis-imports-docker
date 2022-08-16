#!/bin/bash
source ../.env
RUN_NAME=gdal_run_name

# docker run --name $RUN_NAME --rm -it osgeo/gdal bash -c "echo 'test' && sleep 100"

docker run --name $RUN_NAME --rm -it osgeo/gdal ogr2ogr --help

# docker run --rm -it osgeo/gdal bash -c "echo 'test' && sleep 10000"
