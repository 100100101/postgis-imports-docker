# !/bin/bash
source ./postgis/.env

POSTGRES_HOST=127.0.0.1
# --cache specifies how much memory in MB to allocate for caching information. In --slim mode, this is just node positions while in non-slim mode it has to store information about ways and relations too. The rule of thumb in slim mode is as follows: use the size of the PBF file you are trying to import or about 75% of RAM, whatever is smaller. Make sure there is enough RAM left for PostgreSQL. It needs at least the amount of shared_buffers given in its configuration. You may also set --cache to 0 to disable node caching completely. This makes only sense when a flat node file is given and there is not enough RAM to fit most of the cache.
CACHE_MB=2000
# CACHE_MB=65536

OSM_PBF_FILE_PATH=./osm2pgsql/osm/Moscow.osm.pbf
# OSM_PBF_FILE_PATH=/media/s/Новый%20том/planet-220411.osm.pbf
# -E, --proj=SRID # Latlong 4326 # Web Mercator EPSG:3857
# PROJECTION_SRID=3857
PROJECTION_SRID=4326
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

osm2pgsql --create --cache $CACHE_MB --proj=$PROJECTION_SRID --database=$PG_CONNECTION_URL $OSM_PBF_FILE_PATH
