#!/bin/bash

# Ubuntu
BOOT_UBUNTU=${BOOT_UBUNTU:-false}
UBUNTU_MIRROR="${UBUNTU_MIRROR:-http://mirror.enzu.com}"
UBUNTU_DIST="${UBUNTU_DIST:-bionic}"
UBUNTU_ARCH="${UBUNTU_ARCH:-amd64}"

printf "Images to be built:\n"
printf "\tUbuntu: $BOOT_UBUNTU\n"

if [ "$BOOT_UBUNTU" = "true" ] && [ ! -f $TFTP_ROOT/ubuntu ]; then
  printf "Building Ubuntu Image...\n"
  printf "\tMirror: $UBUNTU_MIRROR\n\tDist: $UBUNTU_DIST\n\tArch: $UBUNTU_ARCH\nDownloading Ubuntu..."

  mkdir -p $TFTP_ROOT/ubuntu
  wget -q $UBUNTU_MIRROR/ubuntu/dists/$UBUNTU_DIST/main/installer-$UBUNTU_ARCH/current/images/netboot/ubuntu-installer/$UBUNTU_ARCH/{linux,initrd.gz} -P $TFTP_ROOT/ubuntu/

  printf "Success!\n"
fi
