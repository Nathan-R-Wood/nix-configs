
{ config, pkgs, ... }: {
  services.desktopManager.cosmic.xwayland.enable = true;
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  programs.xwayland.enable = true;
  # Hint to Electron that it's running under wayland.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  users.groups.video.members = [ "allthebeans" ]; #honestly out of other ideas for weird video issues
  
  environment.systemPackages = with pkgs; [
    xwayland
    xdg-desktop-portal-cosmic
    cosmic-session
    cosmic-applets
    cosmic-settings
    cosmic-protocols
    cosmic-launcher
    cosmic-settings-daemon
    cosmic-notifications
    cosmic-screenshot
    cosmic-wallpapers
    cosmic-greeter
    cosmic-files
    cosmic-player
    cosmic-icons
    cosmic-panel
    cosmic-randr
    cosmic-comp
    cosmic-idle
    cosmic-term
    cosmic-edit
    cosmic-bg
    cosmic-osd
  ];
}
