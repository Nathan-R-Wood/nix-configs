{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        prismlauncher
        zulu25
    ];
}
