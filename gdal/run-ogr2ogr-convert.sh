#!/bin/bash
source ../.env

docker run --rm -it osgeo/gdal bash -c "echo 'test' && sleep 10000"
