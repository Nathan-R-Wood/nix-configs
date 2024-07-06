{ config, pkgs, ... }: {
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.interfaces = {
      wg0 = {
          ips = ["10.69.69.1/24"];
            listenPort = 51820;
            privateKeyFile = "/home/allthebeans/wireguard-keys/private";
            peers = [
              { # Blaidd
                publicKey = "Cy3POfXjG0iJzfNEkirAOrt8TVldEo8ez5pT2KVBXyA=";
                allowedIPs = ["10.69.69.2/32"];
              }
              { # Tree-sentinel
                publicKey = "lcX6Tc6VzFhV6vY7qys5UKXyJbjtPw4267jTllPAHFI=";
                allowedIPs = ["10.69.69.3/32"];
              }
              { # Tarnished
                publicKey = "b2lJp6DrTbot3hDKEZnCevIf9MY97hl3An7cSv4IZFI=";
                allowedIPs = ["10.69.69.4/32"];
              }
            ];
      };
  };
}
