{ config, pkgs, ... }: {

  networking.nat.enable = true;
  networking.nat.externalInterface = "wlan0";
  networking.nat.internalInterface = ["wg0"];
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [10.69.69.1/24];
      listenport = 51820
      privateKeyFile = "/home/allthebeans/wireguard-keys/private"
        peers = [
          {
            # Blaidd
            publicKey = "wDS6zaR9KgITGOw6vpDbD4u8d8LUFSSngno/5VcDYH4=";
            allowedIPs = ["10.69.69.2/32"];
          }
          {
            # TBD
          }
        ]
    };
  };
}
