{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
  ];

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader.grub = {
    enable = true;
    device = "/dev/sda";
  }

  users.mutableUsers = true;
  users.users.root.initialPassword = "changeme";

  environment.systemPackages = with pkgs; [
    curl
    wget
    git
  ];

  virtualisation.virtualbox.guest.enable = true;

  system.stateVersion = "23.05";
}
