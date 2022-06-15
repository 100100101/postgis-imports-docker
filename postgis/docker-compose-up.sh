#!/bin/bash
DOTENV_PATH=../.env
source $DOTENV_PATH
# -f "./docker-compose.yml"
COMPOSE_PROJECT_NAME=$POSTGIS_COMPOSE_PROJECT_NAME \
    docker scompose \
    --env-file=$DOTENV_PATH \
    up \
    -d \
    --build

