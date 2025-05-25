
{ config, pkgs, ... }: {
  services.desktopManager.cosmic.xwayland.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  # Hint to Electron that it's running under wayland.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  users.groups.video.members = [ "allthebeans" ]; #honestly out of other ideas for weird video issues
  programs.xwayland.enable = true;
}
