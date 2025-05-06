{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    wireshark
  ];

  users.groups = {
    wireshark.members = [ "allthebeans" ];
  };

  programs.wireshark.enable = true;
}
