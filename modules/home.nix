{ config, pkgs, ... }:{
  home.username = "allthebeans";
  home.homeDirectory = "/home/allthebeans";
  home.stateVersion = "24.05";
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autocd = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      dive = "dive --source podman ";
      nix-generations = "cd /nix/var/nix/profiles/ && ls ";
    };
    history = {
      size = 1000;
      path = "/home/allthebeans/.zsh_history";
    };
    initContent = "path+=('/home/allthebeans/.emacs.d/bin')";
    sessionVariables = {
      DOOMDIR = "$HOME/.doom.d";
    };
  };

  programs.git = {
    enable = true;
    userName = "nathan-r-wood";
    userEmail = "nathanroywood@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
