FROM ubuntu:latest
RUN apt update; \
  apt upgrade -y; \
  apt install git libvorbis libvpx  -y; \
  git clone git://source.ffmpeg.org/ffmpeg.git; \
  cd ffmpeg; \
  ./configure --enable-libvpx --enable-libvorbis; \
  make; \
  make install

