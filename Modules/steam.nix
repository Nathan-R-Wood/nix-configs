{ config, pkgs, ... }: {

    programs.steam = {
        enable = true;
        remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
        # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
    };

    networking.firewall = {
        allowedTCPPorts = [ 24070 ];
        # still doesn't work also tying udp
        allowedUDPPorts = [ 24070 ];
    };

}
