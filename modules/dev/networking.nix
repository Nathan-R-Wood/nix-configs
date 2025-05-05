{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    gns3-gui
    gns3-server
    ubridge
    dynamips
    vpcs
    libvirt
    mtools
    wireshark
  ];
  users.groups.wireshark.members = [ "allthebeans" ];

  services.gns3-server = {
    vpcs.enable = true;
    dynamips.enable = true;
    ubridge.enable = true;
  };

}
