{ config, pkgs, ... }: {

  services.k3s = {
    enable = false;
    role = "server";
    clusterInit = true;
  };

}
