FROM ubuntu:latest
RUN apt update; \
  apt upgrade -y; \
  apt install -y ffmpeg;
COPY files /
VOLUME /home/nick.campion/Downloads:/Downloads
CMD ["/bin/bash", "/convert.sh"]
