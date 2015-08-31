FROM ubuntu:14.04
MAINTAINER Zaheer Merali <zaheermerali@gmail.com>
RUN mkdir /core
RUN apt-get -qq update && apt-get -qqy install build-essential autoconf automake libglib2.0-dev libtool python3-pip
RUN apt-get -qq update && apt-get -qqy install git
RUN apt-get -qq update && apt-get -qqy install ipython
# install gstreamer and plugin libs to /usr/local to avoid linking madness against default install in /usr
#RUN apt-get -qq update && apt-get -qqy build-dep gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad python3-gi python3-gst-1.0
#RUN apt-get -qq update && apt-get -qqy install libnice10 libnice-dev libgupnp-igd-1.0-4 libgupnp-1.0-4 libgupnp-1.0-dev libgupnp-igd-1.0-dev libsctp1 libsctp-dev
RUN mkdir -p /opt/openwebrtc-0.3
ADD . /core/cerbero
WORKDIR /core/cerbero
RUN git config --global user.name "foobar"
RUN git config --global user.email "foo@bar.com"
RUN ./cerbero-uninstalled -c config/linux.cbc bootstrap
RUN ./cerbero-uninstalled -c config/linux.cbc wipe --force
RUN ./cerbero-uninstalled -c config/linux.cbc package -f openwebrtc
RUN dpkg -i /core/cerbero/*.deb
