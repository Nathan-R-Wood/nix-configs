{ config, pkgs, ... }: {

  services.rpcbind.enable = true;

  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = [ "noatime" "soft" "_netdev" "noauto" ];
    };
    what = "great-jar.tailcbbdd7.ts.net:/Containers";
    where = "/mnt/Containers";
  }];

  systemd.automounts = [{
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "10";
    };
    where = "/mnt/Containers";
  }];

}
