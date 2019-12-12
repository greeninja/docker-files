FROM centos:latest
RUN yum update -y && \
  yum install -y epel-release && \
  yum install -y python-pip ansible-2.4.2.0 openssh-clients git ssh-agent && \
  pip install -U pyOpenSSL && \
  useradd nick.campion -u 1000 -d /root && \
  mkdir /root/.ansible && \
  chown -R 1000:1000 /root
