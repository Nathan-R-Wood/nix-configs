{ config, pkgs, ... }: {
  
  services.k3s = {
    enable = false;
    role = "server";
    tokenFile = "/home/allthebeans/.k3s-token";
    serverAddr = "https://jar-bairn.tailcbbdd7.ts.net:6443";
  };
  
}
