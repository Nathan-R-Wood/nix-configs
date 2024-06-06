{ config, pkgs, ... }: {
  # This file is for userful utitilites that every machine will have, so no gui or system specific packages.
  # Enables nix command and flakes.
  nix.settings.experimental-features = ["nix-command" "flakes"];

  environment.systemPackages = with pkgs; [
    pciutils # lspci
    usbutils # lsusb
    btop # prettier top
    git # flakes needs it so every machine needs it
  ];
  # Lets some things get firmware updates which probably only helps.
  services.fwupd.enable = true;
  #fixes some program compatibiility and doesn't seem to hurt anything.
  boot.kernel.sysctl."vm.max_map_count" = 2147483642;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = false;
    settings.PermitRootLogin = "no";
    settings.KbdInteractiveAuthentication = false;
    # Changed from the default port of 22 so gitlab can use 22
    ports = [24];
  };
}
