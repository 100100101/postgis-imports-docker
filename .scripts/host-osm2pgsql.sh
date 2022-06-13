# !/bin/bash
source ../.env

# postgresql://[user[:password]@][netloc][:port][,...][/dbname][?param1=value1&...]
PG_CONNECTION_URL=postgresql://$POSTGRES_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$INNER_POSTGRES_PORT/$POSTGRES_DB

echo "Connection url: $PG_CONNECTION_URL"
echo "OSM file path: $OSM_PBF_FILE_PATH"
echo "Cache size mb: $CACHE_MB"
echo "Projection SRID: $PROJECTION_SRID"
#
# -c, --create - Import only
#
# In case the system doesn’t have much main memory, you can add the -s, --slim and --drop options.
#
# osm2pgsql --create --slim --cache 2000 --database=$PG_CONNECTION_URL $OSM_PBF_FILE_PATH

osm2pgsql --create --cache $CACHE_MB --proj=$PROJECTION_SRID --database=$PG_CONNECTION_URL $OSM_PBF_FILE_PATH
