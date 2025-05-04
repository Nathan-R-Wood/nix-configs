{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        gns3-gui
	gns3-server
	ubridge
	dynamips
	vpcs
	libvirt
	mtools
    ];
}
