FROM centos:latest
RUN yum update -y && \
  yum install bc rsync -y && \
  yum clean all
COPY files .
CMD ./entrypoint.sh
