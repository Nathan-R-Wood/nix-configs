{ config, pkgs, ... }: {
  systemd.tmpfiles.rules = [
    "f /var/lib/systemd/linger/allthebeans"
  ];
}
