{ config, pkgs, ... }: {
    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };
    networking.firewall = {
        enable = true;
        allowedTCPPorts = [ 27040 ]; # Local game transfer
        allowedUDPPortRanges = [
            { from = 27031; to = 27036; } # Local game transfer
        ];
    };
    environment.systemPackages = with pkgs; [
        protonup-qt
    ];
}
