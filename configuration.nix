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
  };

  users.mutableUsers = true;
  users.users.root.initialPassword = "changeme";

  programs.git = {
    enable = true;
    user = {
      name = "Lukas Neubert";
      email = "serkonda7@pm.me";
    };
  };

  environment.systemPackages = with pkgs; [
    curl
    wget
  ];

  virtualisation.virtualbox.guest.enable = true;

  console.keyMap = "de";

  system.stateVersion = "23.05";
}
