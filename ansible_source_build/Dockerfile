FROM python:latest
RUN git clone https://github.com/ansible/ansible.git /home/ansible && \
  cd /home/ansible && \
  pip install packaging 'requests>=1.1' && \
  make && \
  make install
#ENTRYPOINT ["cp", "/home/ansible/bin/ansible", "/tmp/host_vol/", "-f"]
