FROM centos:latest

MAINTAINER hanchen<chen1324@gmail.com>

RUN yum update -y && yum groupinstall 'Development Tools' -y && yum install wget git cmake -y

ENV REPO_NAME ShadowVPN
ENV REPO_GIT_URL https://github.com/cj1324/ShadowVPN.git
ENV REPO_GIT_VERSION 4092250eb4ff664f6fe1f43eb6ddb30ddf824d44

ENV LIBSODIUM_URL https://github.com/jedisct1/libsodium/releases/download/1.0.1/
ENV LIBSODIUM_PACKAGE libsodium-1.0.1

RUN cd /opt && wget ${LIBSODIUM_URL}${LIBSODIUM_PACKAGE}.tar.gz && tar -xzvf ${LIBSODIUM_PACKAGE}.tar.gz && cd ${LIBSODIUM_PACKAGE} && ./autogen.sh && ./configure && make && make install && make clean && ln -s /usr/local/lib/pkgconfig/libsodium.pc  /usr/share/pkgconfig/  && ln -s /usr/local/lib/libsodium.so  /usr/lib64/ && ln -s /usr/local/lib/libsodium.so.13 /usr/lib64/

RUN cd /opt && git clone ${REPO_GIT_URL} && cd ${REPO_NAME} && git checkout ${REPO_GIT_VERSION} && cmake . && make && make install && git clean -dfx

RUN mkdir /var/lib/shadowvpn
VOLUME /var/lib/shadowvpn
WORKDIR /var/lib/shadowvpn

EXPOSE 4000

COPY start.sh /usr/local/bin/shadowvpn.sh

ENTRYPOINT ["/usr/local/bin/shadowvpn.sh"]
