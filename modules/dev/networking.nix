{ config, pkgs-unstable, ... }: {
  environment.systemPackages = with pkgs-unstable; [
    wireshark
  ];

  users.groups = {
    wireshark.members = [ "allthebeans" ];
  };

  programs.wireshark.enable = true;
}
