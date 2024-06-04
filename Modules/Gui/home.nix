{ config, pkgs, ... }:{
  home.username = "allthebeans";
  home.homeDirectory = "/home/allthebeans";
  home.stateVersion = "24.05";
  home = {
    sessionPath = [ "${config.xdg.configHome}/.emacs.d/bin" ];
    sessionVariables = {
      DOOMDIR = "${config.xdg.configHome}/.doom.d";
    };
  };

  xdg = {
    enable = true;
    configFile = {
      "$HOME/.emacs.d" = {
        source = pkgs.fetchgit { url = "https://github.com/doomemacs/doomemacs"; };
      };
    };
  };
}
