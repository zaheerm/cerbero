FROM ubuntu:14.04
MAINTAINER Zaheer Merali <zaheermerali@gmail.com>
RUN mkdir /core
RUN apt-get -qq update && apt-get -qqy install build-essential autoconf automake libglib2.0-dev libtool python3-pip
RUN apt-get -qq update && apt-get -qqy install git

RUN mkdir -p /opt/openwebrtc-0.3
ADD . /core/cerbero
WORKDIR /core/cerbero
RUN git config --global user.name "foobar"
RUN git config --global user.email "foo@bar.com"
RUN ./cerbero-uninstalled -c config/cross-win64.cbc bootstrap
RUN ./cerbero-uninstalled -c config/cross-win64.cbc wipe --force
RUN ./cerbero-uninstalled -c config/cross-win64.cbc package -f openwebrtc
