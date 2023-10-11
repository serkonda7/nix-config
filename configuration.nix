{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";

  users.mutableUsers = true;
  users.users.root.initialPassword = "changeme";

  system.stateVersion = "23.05";
}
