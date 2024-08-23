{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    openrgb-with-all-plugins
    kdePackages.kdenlive
    glaxnimate # for kdenlive
    godot_4
    gimp
    obs-studio
    oversteer
    krita
  ];
  programs.appimage.binfmt = true;
}
