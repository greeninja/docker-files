docker run -it \
  --security-opt label=type:container_runtime_t \
  -v /etc/localtime:/etc/localtime:ro \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -e _=/usr/bin/env \
  -e SHLVL=1 \
  -e PWD=/ \
  --network host \
  greeninja/ie8 bash
