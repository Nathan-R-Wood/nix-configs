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
    #fixes some program compatibiility and doesn't seem to hurt anything.
    boot.kernel.sysctl."vm.max_map_count" = 2147483642;

}
