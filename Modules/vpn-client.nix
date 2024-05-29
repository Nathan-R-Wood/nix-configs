{ config, pkgs, ... }: {
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };
  networking.wireguard.interfaces = {
    wg0 = {
        ips = ["10.69.69.2/24"];
        privateKeyFile = "/home/allthebeans/wireguard-keys/private";
        peers = [
            {
                publicKey = "MMaorcJeSQBLpudkek5owM4FXY1Bnfa5N1f2tEZuG3s=";
                allowedIPs = ["10.69.69.0/24"];
                endpoint = "192.168.0.25:51820";
                persistentKeepalive = 25;
            }
        ];
    };
  };
}
