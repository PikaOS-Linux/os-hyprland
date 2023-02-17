#!/bin/bash

ISO_IMAGE=PikaOS-GNOME-$(date '+%Y-%m-%d').iso

gpg --keyserver keyserver.ubuntu.com --recv-keys 204DD8AEC33A7AFF

apt install --yes --option Acquire::Retries=5 --option Acquire::http::Timeout=100 \
    sudo \
    debootstrap \
    germinate \
    grub-efi-amd64-bin \
    grub-pc-bin \
    isolinux \
    mtools \
    ovmf \
    qemu-efi \
    qemu-kvm \
    squashfs-tools \
    erofs-utils \
    xorriso \
    zsync \
    build-essential \
    apt-utils \
    dosfstools \
    git \
    coreutils
    

echo "Building: $ISO_IMAGE"
make

mkdir -p builds/
mv build/pikaos/22.10/pikaos_22*.iso builds/$ISO_IMAGE
touch builds/checksum.md5
md5sum builds/$ISO_IMAGE > builds/checksum.md5
