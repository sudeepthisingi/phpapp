FROM alpine:3.3
MAINTAINER "Sudeepthi Kakarla Naga"
#Install git
RUN apk update     
RUN apk add git
RUN mkdir /mozjpeg          
RUN cd /mpzjpeg          
RUN git clone git://github.com/mozilla/mozjpeg.git
RUN git checkout v3.1
ADD . /sourceRUN apk --update add autoconf automake build-base libtool nasmRUN cd /source && autoreconf -fiv && ./configure --prefix=/opt/mozjpeg && make install

FROM php:7.2-fpm
RUN mkdir /app
COPY hello.php /app
