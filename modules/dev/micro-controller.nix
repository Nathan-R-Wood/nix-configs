{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        minicom # serial connection
        gcc
        gnumake
        cmake
        gcc-arm-embedded-13
    ];
}
