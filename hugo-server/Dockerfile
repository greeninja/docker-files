FROM ubuntu:latest
RUN apt update -y && \
  apt install hugo -y
WORKDIR /docs
CMD /usr/bin/hugo server --baseURL http://$IP --bind 0.0.0.0
