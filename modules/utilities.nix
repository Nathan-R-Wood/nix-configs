{ config, pkgs, ... }: {
  # This file is for useful utitilites that every machine will have, so no gui or system specific packages.
  # Enables nix command and flakes.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Every machine has podman so it's being moved here.
  virtualisation.containers.enable = true;
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    defaultNetwork.settings.dns_enabled = true;
  };
  environment.systemPackages = with pkgs; [
    pciutils # lspci
    usbutils # lsusb
    btop # prettier top
    git
    tailscale
    nfs-utils
    dive
    podman-tui
    nvd
  ];
  # Lets some things get firmware updates which probably only helps.
  services.fwupd.enable = true;
  #fixes some program compatibiility and doesn't seem to hurt anything.
  boot.kernel.sysctl."vm.max_map_count" = 2147483642;
  # Mounts /tmp on a tmpfs filesystem.
  boot.tmp.useTmpfs = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.PermitRootLogin = "no";
    settings.KbdInteractiveAuthentication = false;
    # Changed from the default port of 22 so gitlab can use 22
    ports = [24];
  };
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.tailscale.enable = true;

  systemd.services.tailscale-autoconnect = {
    description = "Automatic connection to Tailscale";

    # make sure tailscale is running before trying to connect to tailscale
    after = [ "network-pre.target" "tailscale.service" ];
    wants = [ "network-pre.target" "tailscale.service" ];
    wantedBy = [ "multi-user.target" ];

    # set this service as a oneshot job
    serviceConfig.Type = "oneshot";

    # have the job run this shell script
    script = with pkgs; ''
      # wait for tailscaled to settle
      sleep 10

      # check if we are already authenticated to tailscale
      status="$(${tailscale}/bin/tailscale status -json | ${jq}/bin/jq -r .BackendState)"
      if [ $status = "Running" ]; then # if so, then do nothing
         exit 0
      fi

      # otherwise authenticate with tailscale
      ${tailscale}/bin/tailscale up --auth-key="file:/home/allthebeans/.tailscale-key"
    '';
  };

  networking.firewall = {
    trustedInterfaces = [ "tailscale0" ];
    allowedUDPPorts = [ config.services.tailscale.port ];
  };

  # Set your time zone.
  time.timeZone = "America/Boise";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    earlySetup = true;
  };
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
}
