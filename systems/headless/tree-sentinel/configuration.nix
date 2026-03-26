{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  networking.hostName = "Tree-sentinel"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall.enable = false;

  services.tailscale.useRoutingFeatures = "both";
  services.tailscale.extraUpFlags = [
    "--advertise-routes=10.0.0.0/24"
  ];
  services.watchdogd = {
    enable = true;
    settings = {
      interval = lib.mkForce 5;
      timeout = lib.mkForce 120;
      safe-exit = lib.mkForce false;
    };
  };

  services.nfs.server.enable = true;
  services.nfs.server.exports = ''
      /slow *.tailcbbdd7.ts.net(rw,all_squash,anonuid=1000,anongid=1000,nohide,insecure,no_subtree_check)
  '';
  
  boot.loader.grub.enable = lib.mkForce true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
