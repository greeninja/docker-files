FROM python:latest
RUN git clone https://github.com/ansible/ansible.git /home/ansible && \
  cd /home/ansible && \
  pip install packaging && \
  make
ENTRYPOINT ["cp", "/home/ansible/bin/ansible", "/tmp/host_vol/", "-f"]
