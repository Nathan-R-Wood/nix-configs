{ config, pkgs, ... }: {

  services.rpcbind.enable = true;

  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = [ "noatime" "soft" "_netdev" ];
    };
    what = "great-jar.tailcbbdd7.ts.net:/Vault";
    where = "/mnt/Vault";
  }];

  systemd.automounts = [{
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/mnt/Vault";
  }];

}
