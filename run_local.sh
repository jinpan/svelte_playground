#!/bin/bash
set -euxo pipefail

docker build -t svelte-playground .
docker run --name svelte_playground \
    -it -e "TERM=xterm-256color" \
    -p "5173:5173" \
    -v "$(pwd)":/src \
    svelte-playground