{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        minicom # serial connection
        gcc14
        gnumake
        cmake
        gcc-arm-embedded
    ];
}
