# !/bin/bash
source .env
# docker run -i --rm $CONTAINER_NAME cat /usr/share/postgresql/postgresql.conf.sample > my-postgres.conf
docker exec $CONTAINER_NAME cat /usr/share/postgresql/postgresql.conf.sample > default-postgres.conf