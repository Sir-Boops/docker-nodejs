FROM alpine:3.8

ENV NODEJS_VER="8.15.0"

RUN apk upgrade && \
	apk add python make gcc g++ \
		linux-headers libstdc++ && \
	cd ~ && \
	wget https://nodejs.org/download/release/v$NODE_VER/node-v$NODE_VER.tar.xz && \
	tar xf node-v$NODE_VER.tar.xz && \
	cd node-v$NODE_VER && \
	./configure --prefix=/opt/node && \
	make -j$(nproc) && \
	make install && \
	rm -rf ~/*
