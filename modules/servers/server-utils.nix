{ config, pkgs, ... }: {
  systemd.tmpfiles.rules = [
    "f /var/lib/systemd/linger/allthebeans"
  ];

  security.pam.sshAgentAuth.enable = true;

  boot.kernelParams = [ "panic=10" ];
  
  services.watchdogd = {
    enable = true;
    settings = {
      interval = 5;
      timeout = 15;
    };
  };
}
