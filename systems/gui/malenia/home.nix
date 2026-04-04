{ config, pkgs, ... }:{
  imports = [
    ../../../modules/gui/de/river/kwm-config.nix
    ../../../modules/home.nix
  ];
}
  
