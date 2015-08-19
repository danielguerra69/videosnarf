FROM ubuntu:12.04
# videosnarf 
MAINTAINER Daniel Guerra <daniel.guerra69@gmail.com>

#prequisits
RUN apt-get update 
RUN apt-get -y install build-essential zlib1g-dev \
liblzo2-dev libpcap0.8-dev libnet1-dev libasound2-dev \
libbz2-dev libx11-dev libxext-dev libfreetype6-dev vlc \
libvlc-dev libavformat-dev libavdevice-dev libswscale-dev \
libavfilter-dev libx264-dev libav-tools mplayer memcoder
WORKDIR /tmp 
RUN wget http://downloads.sourceforge.net/project/ucsniff/ucsniff/ucsniff-3.2%20src/ucsniff-3.20.tar.gz
RUN tar -xfvz ucsniff-3.20.tar.gz 
WORKDIR /tmp/ucsniff-3.20 
RUN ./configure --enable-libvlc --enable-gui
RUN make 
RUN make install 
RUN rm -rf /tmp 
RUN apt-get -y autoremove
