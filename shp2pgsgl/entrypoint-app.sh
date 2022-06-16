#!/bin/bash
while ! ssh-keyscan -H $CONTAINER_DB_HOST >> $CONTAINER_SSH_PATH/known_hosts
do
    echo "Host not up, trying again..."
    sleep 1;
done
# ssh root@${CONTAINER_DB_HOST} 'echo "SSH COMMAND TEST"'
# tail -f /dev/null
yarn && yarn start:dev
