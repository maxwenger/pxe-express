FROM alpine:3.7

#LABEL maintainer "Maxwell Wenger<max@maxwellwenger.com>"

ENV TFTP_ROOT=/tftpboot
ENV MENU_TEXT="Network Boot"
ENV PXELINUX_BASE_CONFIG="default menu.c32\nprompt 0\nmenu title Boot Menu\nlabel localboot\nmenu lable Boot Local Disk\nlocalboot 0"
ENV NETWORK=192.168.1.0

COPY ./scripts /scripts
RUN chmod +x /scripts/*

RUN apk -q --no-cache add \
  wget \
  bash \
  syslinux \
  dnsmasq

ENTRYPOINT ["/scripts/Startup.sh"]
