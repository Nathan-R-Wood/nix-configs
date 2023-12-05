{ config, pkgs, ... }: {

users.users.defin = {
    isNormalUser = true;
    description = "Dumbest nerd alive";
    extraGroups = ["builders"];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBrDUymBW+rosSI68sxDKLMfH7cOPPLG5K+CuA6aYcsp defin@nixos"
    ];
  };
nix.settings.allowed-users = ["@builders" "@wheel"];
}
