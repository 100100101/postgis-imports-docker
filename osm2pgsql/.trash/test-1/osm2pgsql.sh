# docker run -i -t --rm openfirmware/osm2pgsql -c 'osm2pgsql -h'

# docker run -i -t --rm --link postgres-osm:pg -v ~/osm:/osm openfirmware/osm2pgsql -c 'osm2pgsql --create --slim --cache 2000 --database $PG_ENV_OSM_DB --username $PG_ENV_OSM_USER --host pg --port $PG_PORT__PORT /osm/extract.osm.pbf'


PG_ENV_OSM_USER=gisuser
POSTGRES_PASSWORD=pass
PG_ENV_OSM_DB=gis
PG_PORT__PORT=5432
OSM_PBF_FILENAME=Moscow.osm.pbf
# docker run -i -t --rm --link postgres-osm:pg -v ./osm:/osm openfirmware/osm2pgsql -c 'osm2pgsql --create --slim --cache 2000 --database $PG_ENV_OSM_DB --username $PG_ENV_OSM_USER --host pg --port $PG_PORT__PORT /osm/$OSM_PBF_FILENAME'

# postgresql://[user[:password]@][netloc][:port][,...][/dbname][?param1=value1&...]
PG_CONNECTION_URL=postgresql://$PG_ENV_OSM_USER:$POSTGRES_PASSWORD@localhost:$PG_PORT__PORT/$PG_ENV_OSM_DB

echo "Connection url: $PG_CONNECTION_URL"
echo "OSM filename: $OSM_PBF_FILENAME"


# docker run -p 5432:5432 -i -t --rm -v $(pwd)/osm:/osm openfirmware/osm2pgsql -c "osm2pgsql --create --slim --cache 2000 --database=$PG_CONNECTION_URL /osm/$OSM_PBF_FILENAME"

# docker run -i -t --rm -v $(pwd)/osm:/osm openfirmware/osm2pgsql -c 'osm2pgsql --create --slim --cache 2000 --database=$PG_CONNECTION_URL /osm/$OSM_PBF_FILENAME'

docker run -i -t -v /Users/aaryno/osm-downloads:/data/downloads --network postgis --rm aaryno/osm2pgsql sh -c 'osm2pgsql -U postgres -W -d iceland -H postgis -s -G --number-processes 8 -C 20480 /data/downloads/iceland-latest.osm.pbf'