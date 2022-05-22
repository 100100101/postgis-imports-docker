# docker-compose up

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