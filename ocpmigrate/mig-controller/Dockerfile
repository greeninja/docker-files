FROM quay.io/ocpmigrate/mig-controller:latest
COPY files/ /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust
