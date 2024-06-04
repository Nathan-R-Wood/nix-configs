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

  #xdg = {
  #  enable = true;
  #  configFile = {
  #    "../.emacs.d" = {
  #      source = builtins.fetchGit { url = "https://github.com/doomemacs/doomemacs"; rev = "517daa4ed9168855c202ba2fd28920f6ee17249f"; };
  #   };
  #  };
  #};
}
