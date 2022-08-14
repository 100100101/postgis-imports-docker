#!/bin/bash
source ../.env

PATH_TO_SHAPE=$CONT_SHAPES_PATH/$TABLE_NAME_SHP_FILENAME

# docker exec $POSTGIS_CONTAINER_NAME shp2pgsql -s $PROJECTION_SRID $PATH_TO_SHAPE $TABLE_NAME_SHP_FILENAME | PGPASSWORD=$POSTGRES_PASSWORD psql -d $POSTGRES_DB -U $POSTGRES_USER -h $POSTGRES_HOST -p $INNER_POSTGRES_PORT

# docker exec $POSTGIS_CONTAINER_NAME psql --help

# docker exec $POSTGIS_CONTAINER_NAME shp2pgsql -s $PROJECTION_SRID $PATH_TO_SHAPE $TABLE_NAME_SHP_FILENAME | docker exec $POSTGIS_CONTAINER_NAME psql -d $POSTGRES_DB -U $POSTGRES_USER -h $POSTGRES_HOST -p $INNER_POSTGRES_PORT


docker exec $POSTGIS_CONTAINER_NAME shp2pgsql -s $PROJECTION_SRID $PATH_TO_SHAPE $TABLE_NAME_SHP_FILENAME

# docker exec $POSTGIS_CONTAINER_NAME psql -d $POSTGRES_DB -U $POSTGRES_USER -h $POSTGRES_HOST -p $INNER_POSTGRES_PORT

###################
# --detach,-d		Отсоединенный режим: запуск команды в фоновом режиме
# --detach-keys		Переопределить последовательность клавиш для отсоединения контейнера
# --env,-e		Установить переменные среды
# --env-file		Чтение в файле переменных окружения
# --interactive,-i		Держите STDIN открытым, даже если он не подключен
# --privileged		Дайте расширенные привилегии команде
# --tty,-t		Выделить псевдо-TTY
# --user,-u		Имя пользователя или UID (формат: <name|uid>[:<group|gid>])
# --workdir,-w		Рабочий каталог внутри контейнера
###################

# docker exec
# docker run --rm -it postgis_postgis -c 'ls -la'
# docker exec from_postgis_postgis ls -la

# docker exec from_postgis_postgis which shp2pgsql
# docker exec from_postgis_postgis shp2pgsql -h

# shp2pgsql: illegal option -- v
# RELEASE: 3.1.3 (008d2db)
# USAGE: shp2pgsql [<options>] <shapefile> [[<schema>.]<table>]
# OPTIONS:
#   -s [<from>:]<srid> Set the SRID field. Defaults to 0.
#       Optionally reprojects from given SRID.
#  (-d|a|c|p) These are mutually exclusive options:
#      -d  Drops the table, then recreates it and populates
#          it with current shape file data.
#      -a  Appends shape file into current table, must be
#          exactly the same table schema.
#      -c  Creates a new table and populates it, this is the
#          default if you do not specify any options.
#      -p  Prepare mode, only creates the table.
#   -g <geocolumn> Specify the name of the geometry/geography column
#       (mostly useful in append mode).
#   -D  Use postgresql dump format (defaults to SQL insert statements).
#   -e  Execute each statement individually, do not use a transaction.
#       Not compatible with -D.
#   -G  Use geography type (requires lon/lat data or -s to reproject).
#   -k  Keep postgresql identifiers case.
#   -i  Use int4 type for all integer dbf fields.
#   -I  Create a spatial index on the geocolumn.
#   -m <filename>  Specify a file containing a set of mappings of (long) column
#      names to 10 character DBF column names. The content of the file is one or
#      more lines of two names separated by white space and no trailing or
#      leading space. For example:
#          COLUMNNAME DBFFIELD1
#          AVERYLONGCOLUMNNAME DBFFIELD2
#   -S  Generate simple geometries instead of MULTI geometries.
#   -t <dimensionality> Force geometry to be one of '2D', '3DZ', '3DM', or '4D'
#   -w  Output WKT instead of WKB.  Note that this can result in
#       coordinate drift.
#   -W <encoding> Specify the character encoding of Shape's
#       attribute column. (default: "UTF-8")
#   -N <policy> NULL geometries handling policy (insert*,skip,abort).
#   -n  Only import DBF file.
#   -T <tablespace> Specify the tablespace for the new table.
#       Note that indexes will still use the default tablespace unless the
#       -X flag is also used.
#   -X <tablespace> Specify the tablespace for the table's indexes.
#       This applies to the primary key, and the spatial index if
#       the -I flag is used.
#   -?  Display this help screen.

#   An argument of `--' disables further option processing.
#   (useful for unusual file names starting with '-')
