FROM quay.io/ocpmigrate/mig-ui:latest
COPY files/ /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust
