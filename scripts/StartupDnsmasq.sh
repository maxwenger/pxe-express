#!/bin/bash

dnsmasq \
  --port=0 \
  --dhcp-range=$NETWORK,proxy \
  --dhcp-boot=pxelinux.0 \
  --pxe-service=x86PC,"$MENU_TEXT",pxelinux \
  --enable-tftp \
  --tftp-root=$TFTP_ROOT
