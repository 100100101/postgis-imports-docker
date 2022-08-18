#!/bin/bash

export SHP_IMPORT_FILENAME=antarctica_icesheet_outlines_3857.shp ; SHP_IMPORT_TABLE_NAME=$SHP_IMPORT_FILENAME ; ./shp2pgsql.sh && \
export SHP_IMPORT_FILENAME=antarctica_icesheet_polygons_3857.shp ; SHP_IMPORT_TABLE_NAME=$SHP_IMPORT_FILENAME ; ./shp2pgsql.sh && \
export SHP_IMPORT_FILENAME=land_polygons_complete_3857.shp ; SHP_IMPORT_TABLE_NAME=$SHP_IMPORT_FILENAME ; ./shp2pgsql.sh && \
export SHP_IMPORT_FILENAME=land_polygons_complete.shp ; SHP_IMPORT_TABLE_NAME=$SHP_IMPORT_FILENAME ; ./shp2pgsql.sh && \
export SHP_IMPORT_FILENAME=land_polygons.shp ; SHP_IMPORT_TABLE_NAME=$SHP_IMPORT_FILENAME ; ./shp2pgsql.sh && \
export SHP_IMPORT_FILENAME=land-polygons-split_3857.shp ; SHP_IMPORT_TABLE_NAME=$SHP_IMPORT_FILENAME ; ./shp2pgsql.sh && \
export SHP_IMPORT_FILENAME=simplified-land-polygons-complete_3857.shp ; SHP_IMPORT_TABLE_NAME=$SHP_IMPORT_FILENAME ; ./shp2pgsql.sh && \
export SHP_IMPORT_FILENAME=water-polygons-split_3857.shp ; SHP_IMPORT_TABLE_NAME=$SHP_IMPORT_FILENAME ; ./shp2pgsql.sh