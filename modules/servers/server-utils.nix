{ config, pkgs, ... }: {
  systemd.tmpfiles.rules = [
    "f /var/lib/systemd/linger/allthebeans"
  ];

  security.pam.sshAgentAuth.enable = true;

  services.watchdogd = {
    enable = true;
    settings = {
      interval = 5;
      timeout = 15;
    };
  };
}
