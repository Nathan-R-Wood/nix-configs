{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  networking.hostName = "Tree-sentinel"; # Define your hostname.
  networking.networkmanager.enable = true;
  networking.firewall.enable = false; 

  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };
  networking.wireguard.interfaces = {
    wg0 = {
      ips = ["10.69.69.3/24"];
      privateKeyFile = "/home/allthebeans/wireguard-keys/private";
      peers = [
        { # Jar-bairn
          publicKey = "TjecTK50P+xmhXxqB1H/FUbIYVbSyV+WI2ug+7iWhWw=";
          allowedIPs = ["10.69.69.0/24"];
          endpoint = "192.168.0.24:51820";
          persistentKeepalive = 25;
        }
        { # Tarnished
          publicKey = "b2lJp6DrTbot3hDKEZnCevIf9MY97hl3An7cSv4IZFI=";
          allowedIPs = ["10.69.69.0/24"];
        }
        { # Blaidd
          publicKey = "Cy3POfXjG0iJzfNEkirAOrt8TVldEo8ez5pT2KVBXyA=";
          allowedIPs = ["10.69.69.0/24"];
        }
      ];
    };
  };


  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.loader.efi.canTouchEfiVariables = true;

  system.stateVersion = "24.05"; # Did you read the comment?
}
