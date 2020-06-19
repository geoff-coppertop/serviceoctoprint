#!/usr/bin/bash

source /usr/app/venv/bin/activate

socat pty,link=/tmp/klipper,waitslave,user=service tcp:klipper:3333

PLUGIN_FILE=/usr/app/cfg/plugins.txt
if test -f "$PLUGIN_FILE"; then
    echo "$PLUGIN_FILE exists."

    pip install -r $PLUGIN_FILE
fi

CONFIG_FILE=/usr/app/cfg/config.yaml
CONFIG_ARG=
if test -f "$CONFIG_FILE"; then
    echo "$CONFIG_FILE exists."

    CONFIG_ARG="--config $CONFIG_FILE"
fi

octoprint serve $CONFIG_ARG
