{ config, pkgs, ... }: {

  services.rpcbind.enable = true;

  systemd.mounts = [{
    type = "nfs";
    mountConfig = {
      Options = [ "noatime" "soft" "_netdev" ];
    };
    what = "great-jar.tailcbbdd7.ts.net:/Containers";
    where = "/mnt/Containers";
  }];

  systemd.automounts = [{
    wantedBy = [ "multi-user.target" ];
    after = [ "tailscaled.service" ];
    automountConfig = {
      TimeoutIdleSec = "600";
    };
    where = "/mnt/Containers";
  }];

}
