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
              {
                  publicKey = "Cy3POfXjG0iJzfNEkirAOrt8TVldEo8ez5pT2KVBXyA=";
                  allowedIPs = ["10.69.69.0/24"];
              }
            ];
      };
  };
}
