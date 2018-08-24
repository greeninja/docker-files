FROM ubuntu:trusty
RUN apt update -y && \
  apt install software-properties-common -y && \
  add-apt-repository ppa:ansible/ansible-2.2 -y && \
  apt-get update -y && \
  apt install -y ansible

