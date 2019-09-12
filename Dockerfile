FROM alpine:3.10.2

ENV NODEJS_VER="8.16.1"

RUN apk upgrade && \
	apk add python make gcc g++ \
		linux-headers libstdc++ && \
	cd ~ && \
	wget https://nodejs.org/download/release/v$NODEJS_VER/node-v$NODEJS_VER.tar.xz && \
	tar xf node-v$NODEJS_VER.tar.xz && \
	cd node-v$NODEJS_VER && \
	./configure --prefix=/opt/node && \
	make -j$(nproc) > /dev/null && \
	make install && \
	rm -rf ~/*
