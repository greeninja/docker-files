FROM centos:latest
RUN yum update -y && \
  yum install -y epel-release && \
  yum install -y telnet nc net-tools ruby ngrep traceroute netstat iproute nmap tcpdump && \
  yum clean all && \
  rm -rf /var/cache/yum

