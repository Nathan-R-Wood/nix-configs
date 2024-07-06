{ config, pkgs, ... }: {
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };
  networking.wireguard.interfaces = {
    wg0 = {
        ips = ["10.69.69.0/24"];
        privateKeyFile = "/home/allthebeans/wireguard-keys/private";
        peers = [
            {
                publicKey = "TjecTK50P+xmhXxqB1H/FUbIYVbSyV+WI2ug+7iWhWw=";
                allowedIPs = ["10.69.69.0/24"];
                endpoint = "192.168.0.24:51820";
                persistentKeepalive = 25;
            }
        ];
    };
  };
}
