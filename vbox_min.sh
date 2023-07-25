#!/bin/bash

sudo -i

parted /dev/sda mklabel msdos
parted /dev/sda mkpart primary ext4 1MiB 100%
parted /dev/sda set 1 boot on

mkfs.ext4 -L nixos /dev/sda1
mount /dev/disk/by-label/nixos /mnt

nixos-generate-config --root /mnt
# cp configuration.nix /mnt/etc/nixos/
