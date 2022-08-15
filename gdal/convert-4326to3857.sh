#!/bin/bash
source ../.env
# SHP_FILENAME=boundary-polygon-lvl10
SOURCE_EPGS=4326
TARGET_EPGS=3857

CONVERTED_DIR=$CONT_SHAPES_PATH/converted

mkdir $CONVERTED_DIR

docker run -v $HOST_SHAPES_PATH:$CONT_SHAPES_PATH --rm -it osgeo/gdal ogr2ogr -f "ESRI Shapefile" $CONVERTED_DIR/${SHP_FILENAME}_${TARGET_EPGS}.shp $CONT_SHAPES_PATH/${SHP_FILENAME}.shp -s_srs EPSG:$SOURCE_EPGS -t_srs EPSG:$TARGET_EPGS



