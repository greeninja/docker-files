### Remmina docker image

Run with:

```bash
docker run -d \
-v /etc/localtime:/etc/localtime:ro \
-v /tmp/.X11-unix:/tmp/.X11-unix \
-e DISPLAY=X$DISPLAY \
-v $HOME/.remmina:/root/.remmina \
-v $HOME/.ssh:/root/.host_ssh
remmina
```
