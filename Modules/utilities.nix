{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        pciutils
        usbutils
        btop
        git
    ];
    # Lets some things get firmware updates which probably only helps.
    services.fe = true;
    #fixes some program compatibiility and doesn't seem to hurt anything.
    boot.kernel.sysctl."vm.max_map_count" = 2147483642;

.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
s.PermitRootLogin = "no";
      settings.KbdInteractiveAuthentication = false;
      # Changed from the default port of 22 so gitlab can use 22
 [24];
    };

}
