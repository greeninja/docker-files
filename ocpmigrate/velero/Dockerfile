FROM quay.io/ocpmigrate/velero:latest
COPY files/ /etc/pki/ca-trust/source/anchors/
USER root
RUN /usr/bin/update-ca-trust || /bin/true
USER nobody
