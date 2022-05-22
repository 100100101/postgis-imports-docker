FROM ubuntu

RUN apt-get update && apt-get install -y make cmake g++ libboost-dev libboost-system-dev libboost-filesystem-dev libexpat1-dev zlib1g-dev libbz2-dev libpq-dev libproj-dev lua5.2 liblua5.2-dev

RUN apt-get install -y git

RUN git clone https://github.com/openstreetmap/osm2pgsql.git

RUN mkdir /osm2pgsql/build && cd /osm2pgsql/build && cmake .. && make && make install

ENTRYPOINT /usr/local/bin/osm2pgsql
