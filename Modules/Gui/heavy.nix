{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    openrgb-with-all-plugins
    kdePackages.kdenlive
    godot_4
    gimp
    obs-studio
    oversteer
  ];
}
