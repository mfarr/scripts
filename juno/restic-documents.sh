#!/bin/bash
source /etc/restic/documents.env
restic backup /mnt/data/Data/Sync/Documents > /var/log/restic-documents.txt 2>&1
