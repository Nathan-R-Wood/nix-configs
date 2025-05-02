{ config, pkgs, ... }: {

  boot.supportedFilesystems = [ "nfs" ];
  services.rpcbind.enable = true;

  systemd.mounts = [{
    type = "nfs";
    wantedBy = [ "multi-user.target" ];
    after = [ "tailscaled.service" ];
    mountConfig = {
      Options = [ "noatime" "soft" "_netdev" "x-systemd.idle-timeout=300" "x.systemd.automount" "noauto" ];
    };
    what = "great-jar.tailcbbdd7.ts.net:/Containers";
    where = "/mnt/Containers";
  }];

}
