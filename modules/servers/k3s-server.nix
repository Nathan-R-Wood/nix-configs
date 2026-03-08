{ config, pkgs, ... }: {

  services.k3s = {
    enable = true;
    role = "server";
    clusterInit = true;
    extraFlags = [
      "--tls-san jar-bairn.tailcbbdd7.ts.net"
      "--flannel-iface tailscale0"
    ];
  };

}
