FROM quay.io/ocpmigrate/velero-restic-restore-helper:latest
COPY files/ /etc/pki/ca-trust/source/anchors/
RUN /usr/bin/update-ca-trust || /bin/true
