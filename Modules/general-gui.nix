{ config, pkgs, ... }: {

    Packages = with pkgs; [
    qmk
    firefox
    element-desktop
    discord
    libsForQt5.yakuake
    ];

}
