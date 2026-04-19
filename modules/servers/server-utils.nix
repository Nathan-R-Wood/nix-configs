{ config, pkgs, ... }: {
  systemd.tmpfiles.rules = [
    "f /var/lib/systemd/linger/allthebeans"
  ];
  
  imports = [
    ../users/remote-builds.nix
  ];
  
  boot.kernelParams = [ "panic=10" "softlockup_panic=1" ];
  
  services.watchdogd = {
    enable = true;
    settings = {
      interval = 5;
      timeout = 15;
    };
  };
}
