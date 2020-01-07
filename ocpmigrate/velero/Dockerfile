FROM quay.io/ocpmigrate/velero:latest
COPY files/ /etc/pki/ca-trust/source/anchors/
RUN /usr/bin/update-ca-trust || /bin/true
