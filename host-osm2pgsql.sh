PG_ENV_OSM_DB=gis
POSTGRES_HOST=127.0.0.1
PG_PORT__PORT=5432
PG_ENV_OSM_USER=gisuser
POSTGRES_PASSWORD=pass
# OSM_PBF_FILENAME=Moscow.osm.pbf
# OSM_PBF_FILE_PATH=./osm2pgsql/osm/Moscow.osm.pbf
OSM_PBF_FILE_PATH=/media/s/Новый%20том/planet-220411.osm.pbf
# postgresql://[user[:password]@][netloc][:port][,...][/dbname][?param1=value1&...]
PG_CONNECTION_URL=postgresql://$PG_ENV_OSM_USER:$POSTGRES_PASSWORD@$POSTGRES_HOST:$PG_PORT__PORT/$PG_ENV_OSM_DB
echo "Connection url: $PG_CONNECTION_URL"
echo "OSM file path: $OSM_PBF_FILE_PATH"

osm2pgsql --create --slim --cache 2000 --database=$PG_CONNECTION_URL $OSM_PBF_FILE_PATH
