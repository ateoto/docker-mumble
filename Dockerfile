FROM debian:jessie

RUN apt-get update && apt-get install -y \
    curl \
    bzip2

ENV VERSION 1.2.8

RUN mkdir /mumble 
WORKDIR /mumble

RUN curl -sLO http://downloads.sourceforge.net/project/mumble/Mumble/$VERSION/murmur-static_x86-$VERSION.tar.bz2 && \
    tar -xjf murmur-static_x86-$VERSION.tar.bz2 && \
    rm murmur-static_x86-$VERSION.tar.bz2 && \
    mv murmur-static_x86-$VERSION/* ./ && \
    rm -r murmur-static_x86-$VERSION/ && \
    chmod +x murmur.x86

ADD murmur.ini /mumble/murmur.ini
ADD start_murmur.sh /mumble/start_murmur.sh

EXPOSE 64738/tcp 64738/udp

CMD ["/mumble/start_murmur.sh"]