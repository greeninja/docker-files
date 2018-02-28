FROM alpine:latest
RUN apk --update upgrade && \
    apk add --no-cache --virtual=temporary curl gcc make build-base && \
    curl http://www.iozone.org/src/current/iozone3_434.tar > /tmp/iozone.tar && \
    cd /tmp && \
    tar -xf /tmp/iozone.tar && \
    cd /tmp/iozone*/src/current && \
    make linux && \
    cp iozone /usr/bin/iozone && \
    apk del temporary && \
    rm -rf /var/cache/apk/* /tmp/iozone*

COPY files/iozone.sh iozone.sh

CMD ./iozone.sh
