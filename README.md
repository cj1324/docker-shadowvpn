docker-shadowvpn
================

[![Join the chat at https://gitter.im/cj1324/docker-shadowvpn](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/cj1324/docker-shadowvpn?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

Base on CentOS Docker Image

USAGE
=====

`docker run  -d  --device=/dev/net/tun -p 171:171/udp  --cap-add=NET_ADMIN  -v /home/core/shadowvpn:/var/lib/shadowvpn  cj1324/docker-shadowvpn -c docker-server.conf -v`
