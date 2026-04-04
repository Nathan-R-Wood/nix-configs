{ config, pkgs-unstable, ... }: {
  # Enable the KDE Plasma Desktop Environment.
  programs.xwayland.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;

  # Hint to Electron that it's running under wayland.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs-unstable; [
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.polkit-kde-agent-1
    xwayland
    #kdePackages.xwaylandvideobridge
  ];
}
