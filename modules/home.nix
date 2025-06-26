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
      column.ui = "auto";
      branch.sort = "-committerdate";
      tag.sort = "version:refname";
      diff.algorithm = "histogram";
      diff.colorMoved = "plain";
      diff.memonicPrefix = "true";
      diff.renames = "true";
      push.default = "simple";
      push.autoSetupRemote = "true";
      push.followTags = "true";
      fetch.prune = "true";
      fetch.pruneTags = "true";
      fetch.all = "true";
      commit.verbose = "true";
      rebase.autoSquash = "true";
      rebase.autoStash = "true";
      rebase.updateRefs = "true";
      merge.conflictStyle = "zdiff3";
      pull.rebase = "true";
    };
  };

  programs.starship = {
    enable = true;
    settings = pkgs.lib.importTOML ./starship.toml;
  };
}
