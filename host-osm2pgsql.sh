PG_ENV_OSM_USER=gisuser
POSTGRES_PASSWORD=pass
PG_ENV_OSM_DB=gis
PG_PORT__PORT=5432
OSM_PBF_FILENAME=Moscow.osm.pbf
# postgresql://[user[:password]@][netloc][:port][,...][/dbname][?param1=value1&...]
PG_CONNECTION_URL=postgresql://$PG_ENV_OSM_USER:$POSTGRES_PASSWORD@localhost:$PG_PORT__PORT/$PG_ENV_OSM_DB
echo "Connection url: $PG_CONNECTION_URL"
echo "OSM filename: $OSM_PBF_FILENAME"

osm2pgsql --create --slim --cache 2000 --database=$PG_CONNECTION_URL ./osm2pgsql/osm/$OSM_PBF_FILENAME
