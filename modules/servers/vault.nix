{ config, pkgs, ... }: {
  fileSystems. "/mnt/vault" = {
    device = "great-jar.tailcbbdd7.ts.net:/Vault";
    fsType = "nfs";
  };
}
