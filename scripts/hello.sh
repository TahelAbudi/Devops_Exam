#!/usr/bin/env bash

set -euo pipefail

NAME="${1:-World}"

echo "== Hello Script Output =="
echo "Current Date: $(date)"

if git rev-parse HEAD >/dev/null 2>&1; then
    echo "Git Commit SHA: $(git rev-parse --short HEAD)"
else
    echo "Git Commit SHA: N/A"
fi


echo "Hello, $NAME!"
