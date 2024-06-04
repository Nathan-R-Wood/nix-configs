{ config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        nvme-cli
    ];

    services.fstrim.enable = true;
}
