{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    openrgb-with-all-plugins
    kdePackages.kdenlive
    glaxnimate # for kdenlive
    godot_4
    gimp
    obs-studio
    krita
    blender
    android-udev-rules
    android-tools
  ];
  programs.appimage.binfmt = true;
  programs.adb.enable = true;
}
