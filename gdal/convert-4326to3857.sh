#!/bin/bash
source ../.env
RUN_NAME=gdal_run_name
# SHP_FILENAME=boundary-polygon-lvl10
SOURCE_EPGS=4326
TARGET_EPGS=3857

HOST_CONVERTED_DIR=$HOST_SHAPES_PATH/converted
CONT_CONVERTED_DIR=$CONT_SHAPES_PATH/converted

mkdir -p $HOST_CONVERTED_DIR

echo "Start convert $SHP_FILENAME $SOURCE_EPGS to $TARGET_EPGS"

docker run --name $RUN_NAME \
-v $HOST_SHAPES_PATH:$CONT_SHAPES_PATH \
--rm -it osgeo/gdal \
ogr2ogr -f "ESRI Shapefile" \
$CONT_CONVERTED_DIR/${SHP_FILENAME}_${TARGET_EPGS}.shp \
$CONT_SHAPES_PATH/${SHP_FILENAME}.shp \
-s_srs EPSG:$SOURCE_EPGS \
-t_srs EPSG:$TARGET_EPGS \
-lco ENCODING=UTF-8

echo "Finish convert $SHP_FILENAME $SOURCE_EPGS to $TARGET_EPGS"


