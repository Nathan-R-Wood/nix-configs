{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        pciutils
        usbutils
        btop
        git
        fwupd
    ];
    # Lets some things get firmware updates which probably only helps.
    services.fwupd.enable = true;
}
