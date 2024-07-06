# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {

imports =
    [ # Include the results of the hardware scan.
      ./tarnished.nix
    ];
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "Tarnished"; # Define your hostname.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };
  networking.wireguard.interfaces = {
    wg0 = {
      ips = ["10.69.69.4/24"];
      privateKeyFile = "/home/allthebeans/wireguard-keys/private";
      peers = [
        { # Jar-bairn
          publicKey = "TjecTK50P+xmhXxqB1H/FUbIYVbSyV+WI2ug+7iWhWw=";
          allowedIPs = ["10.69.69.0/24"];
          endpoint = "192.168.0.24:51820";
          persistentKeepalive = 25;
        }
        { # Blaidd
          publicKey = "Cy3POfXjG0iJzfNEkirAOrt8TVldEo8ez5pT2KVBXyA=";
          allowedIPs = ["10.69.69.2/24"];
        }
        { # Tree-sentinel
          publicKey = "lcX6Tc6VzFhV6vY7qys5UKXyJbjtPw4267jTllPAHFI=";
          allowedIPs = ["10.69.69.3/24"];
        }
      ];
    };
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?
}
