FROM quay.io/ocpmigrate/mig-ui:stable
COPY files/ /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust
