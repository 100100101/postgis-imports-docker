# !/bin/bash
source ./.env
source ./postgis/.env

# postgresql://[user[:password]@][netloc][:port][,...][/dbname][?param1=value1&...]
PG_CONNECTION_URL=postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$INNER_POSTGRES_PORT/$POSTGRES_DB
echo "Connection url: $PG_CONNECTION_URL"
echo "OSM file path: $OSM_PBF_FILE_PATH"
#
# -c, --create - Import only
#
# In case the system doesn’t have much main memory, you can add the -s, --slim and --drop options.
#
# osm2pgsql --create --slim --cache 2000 --database=$PG_CONNECTION_URL $OSM_PBF_FILE_PATH

docker run --name ubuntu_bash --rm -it osm2pgsql_ubuntu_osm2pgsql osm2pgsql --create --cache $CACHE_MB --proj=$PROJECTION_SRID --database=$PG_CONNECTION_URL $OSM_PBF_FILE_PATH
