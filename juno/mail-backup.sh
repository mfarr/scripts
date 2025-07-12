#! /bin/bash

DATA_DIR="/mnt/backup/mike/mail"
CONFIG_DIR="/home/mike/.config/imap-backup"
CONFIG_FILE="imap-backup.json"
HEALTHCHECK_PINGKEY="$(OP_SERVICE_ACCOUNT_TOKEN="$(cat /root/.op_service_account_token)" op read op://Services/healthcheck.pingkey/password)"
HEALTHCHECK_SLUG="fastmail-imap-backup"

docker run --rm \
    --volume $DATA_DIR:/data \
    --volume $CONFIG_DIR:/config \
    --dns 8.8.8.8 ghcr.io/joeyates/imap-backup:latest \
    imap-backup backup --config /config/$CONFIG_FILE

exit_code=$?
if [ $exit_code -ne 0 ]; then
    echo "Error: Mail backup failed with exit code $exit_code"
    curl --retry 3 "https://hc-ping.com/$HEALTHCHECK_PINGKEY/$HEALTHCHECK_SLUG/$exit_code"
    exit 1
fi

echo "Mail backup completed successfully"
curl --retry 3 "https://hc-ping.com/$HEALTHCHECK_PINGKEY/$HEALTHCHECK_SLUG"
