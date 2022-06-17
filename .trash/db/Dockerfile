FROM postgis/postgis:14-master
RUN apt-get update && apt-get install -y ssh sudo net-tools
ADD ./entrypoint-db.sh /entrypoint-db.sh
RUN sed -i '2s/^/bash \/entrypoint-db.sh \n/' /usr/local/bin/docker-entrypoint.sh
# CMD ["postgres"]
# ENTRYPOINT [ "docker-entrypoint.sh"]

