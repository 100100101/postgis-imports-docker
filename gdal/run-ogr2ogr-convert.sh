#!/bin/bash
source ../.env

docker run --rm -it osgeo/gdal ogr2ogr -f "ESRI Shapefile" -t_srs EPSG:3857 -s_srs EPSG:4326 $CONT_SHAPES_PATH/converted/output.shp $CONT_SHAPES_PATH/input.shp
