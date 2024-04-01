#!/bin/bash

if [ ! -f "$1" ]; then
    echo "File does not exist."
    exit
fi

source $1
restic backup "${BACKUP_PATH}" > /var/log/restic-$BACKUP_NAME.txt 2>&1

unset $BACKUP_PATH
unset $BACKUP_NAME
