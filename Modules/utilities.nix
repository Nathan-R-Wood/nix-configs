{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        pciutils
        lsusb
        btop
        git
        fwupd
    ];
    # Lets some things get firmware updates which probably only helps.
    services.fwupd.enable = true;
}
