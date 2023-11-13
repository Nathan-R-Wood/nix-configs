{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        qmk
        firefox
        element-desktop
        discord
        libsForQt5.yakuake
	kate
    ];

}
