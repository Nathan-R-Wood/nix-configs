{ config, pkgs, ... }: {
  fileSystems. "/mnt/nfs" = {
    device = "10.69.69.1:/mnt/2tb";
    fsType = "nfs";
  };
}
