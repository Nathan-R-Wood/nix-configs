{ config, pkgs, ... }: {
  # Enable the KDE Plasma Desktop Environment.
  services.xserver.enable = true; # Naming in nix is still cursed. Need this for sddm even wayland only.
  programs.xwayland.enable = true;
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.wayland.enable = true;
  services.desktopManager.plasma6.enable = true;
  # Hint to Electron that it's running under wayland.
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    kdePackages.yakuake
    kdePackages.kate
    kdePackages.kcalc
    kdePackages.polkit-kde-agent-1
    kdePackages.wayland
    kdePackages.wayland-protocols
    xwayland
    kdePackages.xwaylandvideobridge
    kdePackages.kwayland
  ];
}
