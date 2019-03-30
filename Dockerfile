FROM ubuntu:18.04

ENV NODE_VER="8.15.1"
RUN echo "Etc/UTC" > /etc/localtime && \
	apt update && \
	apt -y dist-upgrade && \
	apt -y install wget make gcc g++ python && \
	cd ~ && \
	wget https://nodejs.org/download/release/v$NODE_VER/node-v$NODE_VER.tar.gz && \
	tar xf node-v$NODE_VER.tar.gz && \
	cd node-v$NODE_VER && \
	./configure --prefix=/opt/node && \
	make -j$(nproc) > /dev/null && \
	make install
