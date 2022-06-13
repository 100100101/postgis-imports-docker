# !/bin/bash
DOTENV_PATH=../.env
source $DOTENV_PATH
# -f "./docker-compose.yml"
COMPOSE_PROJECT_NAME=$OSM2PGSQL_COMPOSE_PROJECT_NAME \
    docker compose --env-file=$DOTENV_PATH up -d --build
