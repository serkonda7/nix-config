#!/usr/bin/env bash

parted /dev/sda mklabel msdos
parted /dev/sda mkpart primary 1MB 100%
parted /dev/sda set 1 boot on

mkfs.ext4 -L nixos /dev/sda1
mount /dev/disk/by-label/nixos /mnt

nixos-generate-config --root /mnt
cp configuration.nix /mnt/etc/nixos/

nixos-install --no-root-passwd

# TODO git clone the repo into root

# TODO auto eject iso

echo "Press enter to reboot..."
read -s -n 1
reboot
