FROM bassoman/ubuntu-jdk:1.0.0
MAINTAINER Jon Lancelle <bassoman@gmail.com>

RUN wget "http://apache.mirrorcatalogs.com/xalan/xalan-j/binaries/xalan-j_2_7_2-bin.tar.gz" \
	-O /opt/xalan-j_2_7_2-bin.tar.gz && \
	cd /opt && tar -xzvf xalan-j_2_7_2-bin.tar.gz

ENV CLASSPATH /opt/xalan-j_2_7_2/*
