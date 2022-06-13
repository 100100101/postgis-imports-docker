# !/bin/bash
source ../.env
RUN_NAME=run_ubuntu_osm2pgsql

docker run --name $RUN_NAME --rm -it ${OSM2PGSQL_COMPOSE_PROJECT_NAME}_ubuntu_osm2pgsql osm2pgsql -h
