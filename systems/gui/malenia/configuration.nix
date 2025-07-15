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
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs-unstable.linuxPackages_latest;
  boot.plymouth.enable = false;

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
  services.fprintd.enable = true;

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

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
  hardware.amdgpu.initrd.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" "nvidia" ];

  hardware.nvidia.modesetting.enable = false;
  hardware.nvidia.prime.allowExternalGpu = true;
  hardware.nvidia.prime.offload.enable = true;
  hardware.nvidia.open = true;
  hardware.nvidia.prime.nvidiaBusId = "PCI:@0:195:0:5";
  hardware.nvidia.prime.amdgpuBusId = "PCI:@0:193:0:0";

  # external display on the eGPU card
  # otherwise it's discrete mode using laptop screen
  specialisation = {
    external-display.configuration = {
        system.nixos.tags = [ "external-display" ];
        hardware.nvidia.modesetting.enable = pkgs-unstable.lib.mkForce false;
        hardware.nvidia.prime.offload.enable = pkgs-unstable.lib.mkForce false;
        hardware.nvidia.powerManagement.enable = pkgs-unstable.lib.mkForce false;
        services.xserver.config = pkgs-unstable.lib.mkOverride 0
        ''
          Section "Module"
            Load           "modesetting"
          EndSection

          Section "Device"
            Identifier     "Device0"
            Driver         "nvidia"
            BusID          "@0:195:0:5"
            Option         "AllowEmptyInitialConfiguration"
            Option         "AllowExternalGpus" "True"
          EndSection
          '';
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?
}
