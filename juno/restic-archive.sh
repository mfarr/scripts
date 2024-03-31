#!/bin/bash
source /etc/restic/archive.env
restic backup /mnt/backup/backup/Mike/Archived > /var/log/restic-archive.txt 2>&1
