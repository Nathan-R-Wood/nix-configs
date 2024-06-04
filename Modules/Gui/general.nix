{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        qmk
        firefox
        element-desktop
        discord
        kdePackages.yakuake
        kdePackages.kate
        kdePackages.kcalc
    ];

}
