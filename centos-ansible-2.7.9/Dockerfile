FROM centos:latest
RUN yum update -y && \
  yum install -y epel-release && \
  yum install -y python-pip openssh-clients git ssh-agent vim && \
  pip install -U pyOpenSSL && \
  pip install -U ansible==2.7.9 && \
  useradd nick.campion -u 1000 -d /root && \
  mkdir /root/.ansible && \
  chown -R 1000:1000 /root
