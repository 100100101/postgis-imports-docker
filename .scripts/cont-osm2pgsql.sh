# !/bin/bash
source ../.env

PG_CONNECTION_URL=postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$INNER_POSTGRES_PORT/$POSTGRES_DB
echo "Connection url: $PG_CONNECTION_URL"
echo "OSM file path: $OSM_PBF_FILE_PATH"
echo "Cache size mb: $CACHE_MB"
echo "Projection SRID: $PROJECTION_SRID"

docker run --name ubuntu_bash --rm -it osm2pgsql_ubuntu_osm2pgsql osm2pgsql --create --cache $CACHE_MB --proj=$PROJECTION_SRID --database=$PG_CONNECTION_URL $OSM_PBF_FILE_PATH
