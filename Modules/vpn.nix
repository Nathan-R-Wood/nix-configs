{ config, pkgs, ... }: {

  networking.nat.enable = true;
  networking.nat.externalInterface = "wlan0";
  networking.nat.internalInterface = ["wg0"];
  networking.firewall = {
    allowedUDPPorts = [ 51820 ];
  };

  networking.wiregaurd.interfaces = {
    wg0 = {
      ips = [10.69.69.1/24];
      listenport = 51820
    };
  };

}
