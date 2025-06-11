# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs-unstable,lib,  ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./malenia.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = false;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs-unstable.linuxPackages_latest;
  boot.loader = {
    efi = {
      efiSysMountPoint = "/boot"; # ← use the same mount point here.
    };
    grub = {
      efiSupport = true;
      device = "nodev";
    };
  };

  networking.hostName = "Malenia"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

  services.power-profiles-daemon.enable = true;
  services.fprintd.enable = true; #enables the fingerprint reader

  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 25565 ];
    allowedUDPPorts = [ 25565 ];
  };

  environment.systemPackages = with pkgs-unstable; [
   nvtopPackages.amd
   framework-tool
   libinput
  ];

  console.earlySetup = lib.mkForce false;

  hardware.sensor.iio.enable = false; # The sensor works but there isn't an easy way to use it

  services.xserver.videoDrivers = [ "modeset" "amdgpu" ];
  services.xserver.enable = true;
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
