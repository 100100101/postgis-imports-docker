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

osm2pgsql --create --cache $CACHE_MB --proj=$PROJECTION_SRID --database=$PG_CONNECTION_URL $HOST_OSM_FILES_DIR

# Как я уже сказал, 6 часов — это моя догадка; из-за высоких требований к памяти я в последнее время не запускал osm2pgsql на файле планеты без --slim. Я думаю, если у вас 512 ГБ ОЗУ и 4-8 ядер, у вас должно быть все в порядке. Точные аргументы командной строки зависят от того, какой стиль карты вы будете использовать и т. д., но, скорее всего, это будет что-то вроде:

# osm2pgsql -d gis --hstore планета-последняя.osm.pbf

# некоторые стили предполагают, что вы будете использовать специальный файл стиля, файл преобразования LUA и, возможно, порекомендуют -Gвариант для построения правильных мультиполигонов, каждый из которых может немного замедлить работу. Если вам нужны преобразования LUA, сборка osm2gpsql с помощью «luajit» может восстановить часть времени, используемого для обработки LUA. Я не уверен на 100% в --cacheпараметре, раньше он не имел значения для нетонкого режима, но вам придется это увидеть. Сообщите о своих результатах!
