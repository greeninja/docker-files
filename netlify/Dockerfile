FROM node:latest
RUN apt update && \
  git clone https://github.com/greeninja/victor-hugo.git /home/netlify && \
  cd /home/netlify && \
  npm install && \
  apt-get clean && \
  rm -rf /var/cache/apt/archives/
WORKDIR /home/netlify
ENTRYPOINT ["/usr/local/bin/npm", "start"]
