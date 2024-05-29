{ config, pkgs, ... }: {

  #networking.nat.enable = true;
  #networking.nat.externalInterface = "wlan0";
  #networking.nat.internalInterfaces = ["wg0"];
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
                  publicKey = "mP28sB+ykEQr6ajtvYEs9WQHpZL08tK2Hw0tS3AX52c=";
                  allowedIPs = ["10.69.69.0/24"];
                  endpoint = "192.168.0.134";
              }
            ];
      };
  };
}
