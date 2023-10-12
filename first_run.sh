#!/usr/bin/env bash

git clone https://github.com/serkonda7/nix-config.git
cd nix-config

ln -f configuration.nix /etc/nixos/configuration.nix
ln -f flake.nix /etc/nixos/flake.nix
