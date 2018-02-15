#!/bin/bash
docker run -d \
--security-opt label=type:container_runtime_t \
-v /etc/localtime:/etc/localtime:ro \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=unix$DISPLAY \
-v $HOME/.remmina:/root/.remmina \
-v $HOME/.ssh:/root/.host_ssh \
-e _=/usr/bin/env \
-e SHLVL=1 \
-e PWD=/ \
greeninja/remmina
