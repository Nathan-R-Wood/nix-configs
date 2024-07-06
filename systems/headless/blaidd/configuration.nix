# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }: {

  imports = [ # Include the results of the hardware scan.
    ./blaidd.nix
  ];

  # Bootloader.
  boot = {
    kernelPackages = pkgs.linuxKernel.packages.linux_rpi4;
    initrd.availableKernelModules = [ "xhci_pci" "usbhid" "usb_storage" ];
    loader = {
      grub.enable = false;
      generic-extlinux-compatible.enable = true;
    };
  };

  networking.hostName = "Blaidd"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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
      ips = ["10.69.69.2/24"];
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
        { # Tree-sentinel
          publicKey = "lcX6Tc6VzFhV6vY7qys5UKXyJbjtPw4267jTllPAHFI=";
          allowedIPs = ["10.69.69.0/24"];
        }
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = false;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
}
