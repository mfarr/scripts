#! /bin/sh

DATA_DIR="/mnt/backup/backup/Mike/Mail"
CONFIG_DIR="/home/mike/.config/imap-backup"
CONFIG_FILE="imap-backup.json"
HEALTHCHECK_UUID="$(op read op://Services/healthcheck.email-backup.uuid/password)"

docker run -it \
    --volume $DATA_DIR:/data \
    --volume $CONFIG_DIR:/config \
    --dns 8.8.8.8 ghcr.io/joeyates/imap-backup:latest \
    imap-backup backup --config /config/$CONFIG_FILE

exit_code=$?
if [ $exit_code -ne 0 ]; then
    echo "Error: Mail backup failed with exit code $exit_code"
    curl --retry 3 "https://hc-ping.com/$HEALTHCHECK_UUID/$exit_code"
    exit 1
fi

echo "Mail backup completed successfully"
curl --retry 3 "https://hc-ping.com/$HEALTHCHECK_UUID"
