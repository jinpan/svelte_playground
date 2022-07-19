#!/bin/bash
set -euxo pipefail

docker build -t svelte-tutorial .
# The below command is for bootstrap to drop into a shell
# docker run \
#     -v "$(pwd)":/src \
#     --rm -it \
#     --entrypoint /bin/bash \
#     svelte-tutorial

docker run \
    -it -e "TERM=xterm-256color" \
    -p "5173:5173" \
    -v "$(pwd)":/src \
    svelte-tutorial