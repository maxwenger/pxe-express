#!/bin/bash

mkdir -p $TFTP_ROOT/pxelinux.cfg/
printf $PXELINUX_BASE_CONFIG > $TFTP_ROOT/pxelinux.cfg/default

cp -r /usr/share/syslinux/pxelinux.0 $TFTP_ROOT/
cp /usr/share/syslinux/{menu,ldlinux,libmenu,libutil}.c32 $TFTP_ROOT/

bash /scripts/BuildImages.sh
bash /scripts/StartupDnsmasq.sh
bash
