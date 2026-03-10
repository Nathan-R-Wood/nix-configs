# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, microvm,  ... }: {
    imports =
      [ # Include the results of the hardware scan.
        # ./radahn.nix
      ];

    networking.hostName = "Radahn"; # Define your hostname.
    networking.networkmanager.enable = true;

     # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    microvm.hypervisor = "cloud-hypervisor";
    microvm.shares = [{
      source = "/nix/store";
      mountPoint = "/nix/.ro-store";
      tag = "ro-store";
      proto = "virtiofs";
    }];
    microvm.volumes = [{
      image = "/var/lib/microvms/Radahn/root.raw";
      mountPoint = "/";
      size = 100000;
      label = "root";
    }];
    microvm.hotplugMem = 80000;
    microvm.hotpluggedMem = 1500;

    microvm.interfaces = [{
      type = "tap";
      id = "vm-Radahn";
      mac = "02:00:00:00:00:02";
    }];
    microvm.vcpu = 28;

    systemd.network = {
      enable = true;
      networks."20-lan" = {
        matchConfig.Type = "ether";
        networkConfig = {
          Address = ["10.1.15.103/24" "2001:db8::c/64"];
          Gateway = "10.1.15.254";
          DNS = ["8.8.8.8"];
          IPv6AcceptRA = true;
          DHCP = "no";
        };
      };
    };
    
    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # # programs.mtr.enable = true;
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
