# FROM ubuntu:latest
FROM centos:centos7.7.1908
ENV CENTOS=distro

RUN yum update -y && yum install wget bzip2 -y && yum clean all -y

LABEL version="v0.0.4"
# Download/Install latest FAH client
# See here for latest - https://foldingathome.org/alternative-downloads/
RUN rpm -Uhv https://download.foldingathome.org/releases/public/release/fahclient/centos-6.7-64bit/v7.5/fahclient-7.5.1-1.x86_64.rpm
COPY config.xml /etc/fahclient/config.xml
WORKDIR /var/lib/fahclient
CMD	["/usr/bin/FAHClient", \
	"--config", "/etc/fahclient/config.xml", \
	"--config-rotate=false", \
	"--gpu=false", \
	# "--run-as", "fahclient", \
	"--pid-file=/var/run/fahclient.pid"]
