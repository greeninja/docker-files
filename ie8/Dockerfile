FROM ubuntu:latest
RUN apt update && apt upgrade -y
RUN apt update
RUN apt install -y software-properties-common vim
RUN dpkg --add-architecture i386
RUN add-apt-repository ppa:ricotz/unstable -y
RUN apt update
RUN apt install -y wine32 cabextract curl
ENV WINEARCH=win32
ENV WINEPRFIX=~/.wine32ie8
RUN curl https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks -o /sbin/winetricks
RUN chmod +x /sbin/winetricks
RUN apt clean -y
RUN rm -rf /var/lib/apt/lists/*
RUN useradd bob
# CMD ["bash","-c","remmina"]
