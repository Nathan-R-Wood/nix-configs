{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  networking.hostName = "Tree-sentinel"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  system.stateVersion = "24.05"; # Did you read the comment?
}
