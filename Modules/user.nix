{ config, pkgs, ... }: {

users.users.allthebeans = {
    isNormalUser = true;
    description = "Some name or something";
    extraGroups = [ "networkmanager" "wheel" ];
  };

}
