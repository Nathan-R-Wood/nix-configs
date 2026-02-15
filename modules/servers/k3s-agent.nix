{ config, pkgs, ... }: {
  
  services.k3s = {
    enable = true;
    role = "agent";
    tokenFile = "/home/allthebeans/.k3s-token";
    serverAddr = "https://jar-bairn.tailcbbdd7.ts.net:6443";
  };
  
}
