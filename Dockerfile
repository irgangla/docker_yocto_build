FROM ubuntu:18.04

WORKDIR /yocto

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get -y install aptitude
RUN aptitude update
RUN aptitude -y install git build-essential vim

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
RUN dpkg-reconfigure --frontend noninteractive tzdata

RUN aptitude -y install cpio python2.7 gawk wget git-core diffstat unzip texinfo gcc-multilib chrpath socat libsdl1.2-dev xterm

RUN ln -s /usr/bin/python2.7 /usr/bin/python2
RUN ln -s /usr/bin/python2.7 /usr/bin/python

RUN aptitude -y install locales
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8


RUN useradd -ms /bin/bash yb

USER yb

