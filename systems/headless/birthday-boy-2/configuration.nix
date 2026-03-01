{ config, nixos-raspberrypi, lib, ... }: {

  imports = [ # Include the results of the hardware scan.
    ./birthday-boy-2.nix
  ];
  boot.loader.raspberry-pi.bootloader = lib.mkForce "kernel";
    system.nixos.tags = let
      cfg = config.boot.loader.raspberry-pi;
    in [
      "raspberry-pi-${cfg.variant}"
      cfg.bootloader
      config.boot.kernelPackages.kernel.version
    ];

  networking.hostName = "Birthday-boy-2"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = false;

  # Or disable the firewall altogether.
  networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?
}
