#!/usr/bin/env bash
service ssh start
rm -rf $CONTAINER_SSH_PATH ; ssh-keygen -t rsa -f $CONTAINER_SSH_PATH/id_rsa
echo $(cat $CONTAINER_SSH_PATH/id_rsa.pub) >> $CONTAINER_SSH_PATH/authorized_keys
# tail -f /dev/null