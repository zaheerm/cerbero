# OpenWebRTC fork of cerbero

## How do I use this?

[Using this cerbero fork to build OpenWebRTC](https://github.com/EricssonResearch/openwebrtc/wiki/Building-OpenWebRTC)

## What is cerbero?

[cerbero](http://cgit.freedesktop.org/gstreamer/cerbero/) is a build system
written by GStreamer developers to build all GStreamer dependencies, GStreamer
itself and package it up into nice platform-specific SDK-like binary files.

## Why a fork?

OpenWebRTC needs some extra dependencies that are not desirable to have in
upstream cerbero. OpenWebRTC also needs some bits and pieces built in specific
ways to meet our needs.

We like collaboration and hope the use of cerbero to build OpenWebRTC will be
mutually beneficial. *All real cerbero changes are being submitted upstream!*

## Building in docker

Once you have docker installed, do a: docker build .

Currently the windows build fails on gst-plugins-bad ext/dtls due to X509_NAME being declared by mingw as well as openssl.
