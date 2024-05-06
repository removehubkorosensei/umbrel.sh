#!/usr/bin/env bash

INSTALL_PATH=${INSTALL_PATH:-$PWD/data}
DOCKER_BINARY=${DOCKER_BINARY:-$(which docker)}
NGINX_PORT=${NGINX_PORT:-8090}

FLAGS=
while [[ $1 == -* ]]; do FLAGS="$FLAGS $1"; shift; done;

if [[ "$1" == "" || "$1" == "scripts/start"* ]]; then
    if [[ ! "$FLAGS" == *"--name="* ]]; then
        FLAGS="$FLAGS --name=Umbrel"
    fi
elif [[ ! "$FLAGS" == *"--rm"* ]]; then
    FLAGS="$FLAGS --rm"
fi

docker run $FLAGS \
    -e NGINX_PORT=$NGINX_PORT \
    -e DOCKER_BINARY=$DOCKER_BINARY \
    -e INSTALL_PATH=$INSTALL_PATH \
    -v $INSTALL_PATH:$INSTALL_PATH \
    -v /var/run/docker.sock:/var/run/docker.sock \
    local/umbrel \
    "$@"
