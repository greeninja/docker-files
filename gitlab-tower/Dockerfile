FROM centos:latest

# Setup Gitlab Runner

RUN yum update -y && \
  curl -o /usr/local/bin/gitlab-runner https://gitlab-runner-downloads.s3.amazonaws.com/latest/binaries/gitlab-runner-linux-amd64 && \
  chmod +x /usr/local/bin/gitlab-runner && \
  useradd --comment 'GitLab Runner' --create-home gitlab-runner --shell /bin/bash

# Install Tower CLI

RUN yum install -y epel-release && \
  yum install -y python-pip && \
  pip install ansible-tower-cli && \
  yum clean all

COPY entrypoint.sh /usr/local/sbin/entrypoint
RUN chmod +x /usr/local/sbin/entrypoint

ENTRYPOINT /usr/local/sbin/entrypoint
