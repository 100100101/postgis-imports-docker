#!/bin/bash
export SHP_IMPORT_TABLE_NAME=antarctica_icesheet_outlines_3857 ; export SHP_IMPORT_FILENAME=$SHP_IMPORT_TABLE_NAME ; ./shp2pgsql.sh && \
export SHP_IMPORT_TABLE_NAME=land-polygons-split_3857 ; export SHP_IMPORT_FILENAME=$SHP_IMPORT_TABLE_NAME ; ./shp2pgsql.sh && \
export SHP_IMPORT_TABLE_NAME=simplified-land-polygons-complete_3857 ; export SHP_IMPORT_FILENAME=$SHP_IMPORT_TABLE_NAME ; ./shp2pgsql.sh && \
export SHP_IMPORT_TABLE_NAME=water-polygons-split_3857 ; export SHP_IMPORT_FILENAME=$SHP_IMPORT_TABLE_NAME ; ./shp2pgsql.sh && \
