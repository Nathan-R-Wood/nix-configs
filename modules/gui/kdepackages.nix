{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs.kdePackages; [
    yakuake
    kate
    kcalc
    polkit-kde-agent-1
    kdeconnect-kde
    partitionmanager
    ksystemlog
    sddm-kcm
  ];
  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
    allowedUDPPortRanges = [
      { from = 1714; to = 1764; } # KDE Connect
    ];
  };
}
