{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs.kdePackages; [
    kdeconnect-kde
    partitionmanager
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
