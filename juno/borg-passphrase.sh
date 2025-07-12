#!/bin/bash

if [ -z "$1" ]; then
    echo "Usage: $0 <borg-repo-name>"
    exit 1
fi

OP_SERVICE_ACCOUNT_TOKEN="$(cat /root/.op_service_account_token)"

env OP_SERVICE_ACCOUNT_TOKEN="$OP_SERVICE_ACCOUNT_TOKEN" op read "op://Services/borg.$1/password"