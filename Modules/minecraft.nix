{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        prismlauncher
    ];
    programs.prismlauncher.enable = true;
}
