PG_ENV_OSM_USER=gisuser
POSTGRES_PASSWORD=pass
PG_ENV_OSM_DB=gis
PG_PORT__PORT=5432
OSM_PBF_FILENAME=Moscow.osm.pbf
# postgresql://[user[:password]@][netloc][:port][,...][/dbname][?param1=value1&...]
PG_CONNECTION_URL=postgresql://$PG_ENV_OSM_USER:$POSTGRES_PASSWORD@localhost:$PG_PORT__PORT/$PG_ENV_OSM_DB
echo "Connection url: $PG_CONNECTION_URL"
echo "OSM filename: $OSM_PBF_FILENAME"

IMAGE_NAME=osm2pgsql-custom:latest
HOST_PATH_TO_OSM_FILES=$(pwd)/osm
CONTAINER_PATH_TO_OSM_FILES=/data/downloads
# docker run -p 5432:5432 -i -t --rm -v $(pwd)/osm:/osm openfirmware/osm2pgsql -c "osm2pgsql --create --slim --cache 2000 --database=$PG_CONNECTION_URL /osm/$OSM_PBF_FILENAME"

# docker run -i -t --rm -v $(pwd)/osm:/osm openfirmware/osm2pgsql -c 'osm2pgsql --create --slim --cache 2000 --database=$PG_CONNECTION_URL /osm/$OSM_PBF_FILENAME'

# docker run -i -t -v $HOST_PATH_TO_OSM_FILES:$CONTAINER_PATH_TO_OSM_FILES --network postgis --rm $IMAGE_NAME sh -c 'osm2pgsql -U postgres -W -d iceland -H postgis -s -G --number-processes 8 -C 20480 /data/downloads/iceland-latest.osm.pbf'

# docker build -t $IMAGE_NAME .
# --rm=false: Automatically remove the container when it exits
docker run --rm -it osm2pgsql-custom:latest -c 'osm2pgsql -h'

# docker run --name=grafana

docker network create postgis-net
# docker run --detach --name test-postgis --network postgis-net postgis/postgis