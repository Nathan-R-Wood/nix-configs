{ config, pkgs, ... }: {

  services.rpcbind.enable = true;

  systemd.mounts = [{
    description = "fast and safe ssd nas";
    type = "nfs";
    mountConfig = {
      Options = [ "noatime" "soft" "_netdev" "noauto" "nofail" ];
    };
    what = "great-jar.tailcbbdd7.ts.net:/Containers";
    where = "/mnt/Containers";
  }
  {
    description = "slow and unreliable hdd storage";
    type = "nfs";
    mountConfig = {
      Options = [ "noatime" "soft" "_netdev" "noauto" "nofail" ];
    };
    what = "tree-sentinel.tailcbbdd7.ts.net:/slow";
    where = "/mnt/slow";
    
  }];

  systemd.automounts = [{
    description = "ssd nas";
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "10";
    };
    where = "/mnt/Containers";
  }
  {
    description = "hdd";
    wantedBy = [ "multi-user.target" ];
    automountConfig = {
      TimeoutIdleSec = "10";
    };
    where = "/mnt/slow";
  }];

}
