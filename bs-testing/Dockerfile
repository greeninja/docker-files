FROM centos
RUN yum update -y && \
  yum install -y wget curl && \
  yum clean all
COPY ./files/* /
RUN chmod 755 /check.sh
CMD /check.sh

