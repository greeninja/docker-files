FROM ubuntu:latest
RUN apt update && apt upgrade -y; \
  apt install remmina remmina-plugin-* -y; \
  apt clean -y; \
  rm -rf /var/lib/apt/lists/*;
CMD ["bash","-c","remmina"]
