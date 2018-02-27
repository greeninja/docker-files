FROM wordpress:php7.2
RUN apt update && \
  apt install ssmtp -y && \
  a2enmod remoteip && \
  echo "RemoteIPHeader X-Forwarded-For" >> /etc/apache2/conf-available/remoteip.conf && \
  echo "RemoteIPTrustedProxy 10.128.0.1" >> /etc/apache2/conf-available/remoteip.conf && \
  a2enconf remoteip && \
  sed -i 's/LogFormat "%h.* combined$/LogFormat "%a %l %u %t \"%r\" %>s %O \"%{Referer}i\" \"%{User-Agent}i\"" combined/' /etc/apache2/apache2.conf && \
  apt-get clean all
