#!/bin/bash
cd /home/mike/Storage/server
docker compose down
restic-backup /etc/restic/server.env
docker compose up -d
