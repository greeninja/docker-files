FROM quay.io/ocpmigrate/migration-plugin:stable
COPY files/ /etc/pki/ca-trust/source/anchors/
RUN /usr/bin/update-ca-trust || /bin/true
