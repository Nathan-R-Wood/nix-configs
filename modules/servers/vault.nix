{ config, pkgs, ... }: {

  services.rpcbind.enable = true;

  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = [ "noatime" "soft" "_netdev" "noauto" ];
    };
    what = "great-jar.tailcbbdd7.ts.net:/Vault";
    where = "/mnt/Vault";
  }];

  systemd.automounts = [{
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "10";
    };
    where = "/mnt/Vault";
  }];

}
