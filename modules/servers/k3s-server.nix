{ config, pkgs, ... }: {

  services.k3s = {
    enable = false;
    role = "server";
    tokenFile = "/home/allthebeans/.k3s-token";
    clusterInit = true;
  };
   services.etcd.enable = false;

}
