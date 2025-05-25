#! /bin/sh

DATA_DIR="/mnt/backup/backup/Mike/Mail"
CONFIG_FILE="/home/mike/.config/imap-backup/imap-backup.json"

docker run -it \
    --volume $DATA_DIR:/data \
    --volume ./imap-backup/config:/config \
    --dns 8.8.8.8 ghcr.io/joeyates/imap-backup:latest \
    imap-backup backup --config $CONFIG_FILE
