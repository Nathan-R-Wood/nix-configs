{ config, pkgs, ... }:{
  home.username = "allthebeans";
  home.homeDirectory = "/home/allthebeans";
  home.stateVersion = "24.05";
  programs.bash.enable = true;
  home = {
    sessionPath = [ "$HOME/.emacs.d/bin" ];
    sessionVariables = {
      DOOMDIR = "$HOME/.doom.d";
    };
  };
  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
