{ config, pkgs, ... }: {

  services.k3s = {
    enable = true;
    role = "server";
    tokenFile = "/home/allthebeans/.k3s-token";
    clusterInit = true;
  };

}
