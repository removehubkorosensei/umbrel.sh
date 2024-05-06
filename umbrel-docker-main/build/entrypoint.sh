#!/usr/bin/env bash

CMD=$1
shift

"$INSTALL_PATH/$CMD" $@

if [[ "$CMD" == "scripts/start"* ]]; then
    echo "Waiting for shutdown ..."
    trap "echo 'Shutting down...'; $INSTALL_PATH/scripts/stop; exit" INT TERM
    sleep inf & wait
fi