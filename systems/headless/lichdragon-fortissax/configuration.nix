{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Lichdragon-fortissax"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  system.stateVersion = "25.11"; # Did you read the comment?
}
