#!/usr/bin/env bash

docker run -p 9081:80 \
  -v /home/nick.campion/.pdb:/etc/puppetlabs/puppetdb \
  -v /etc/hosts:/etc/hosts \
  -e PUPPETDB_HOST=puppet-db.fasthosts.net.uk \
  -e PUPPETDB_PORT=8081 \
  -e PUPPETDB_SSL_VERIFY=/etc/puppetlabs/puppetdb/ca/ca_crt.pem \
  -e PUPPETDB_KEY=/etc/puppetlabs/puppetdb/private_keys/nick.campion.glo.gb.pem \
  -e PUPPETDB_CERT=/etc/puppetlabs/puppetdb/certs/nick.campion.glo.gb.pem \
  -e INVENTORY_FACTS='Hostname,fqdn, IP Address,ipaddress' \
  -e ENABLE_CATALOG=True \
  -e GRAPH_FACTS='architecture,puppetversion,osfamily' \
  greeninja/puppetboard:old
