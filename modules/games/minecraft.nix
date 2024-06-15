{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        prismlauncher
    ];
    # this doesn't exist so no easy to set up lan because why would syntax in this god forsaken operating system stay consistent
    # programs.prismlauncher.enable = true;
}
