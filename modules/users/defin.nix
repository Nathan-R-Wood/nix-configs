{ config, pkgs, ... }: {

users.users.defin = {
    isNormalUser = true;
    description = "Dumbest nerd alive";
    extraGroups = ["builders" "wheel"];
    packages = with pkgs; [helix];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBrDUymBW+rosSI68sxDKLMfH7cOPPLG5K+CuA6aYcsp defin@nixos"
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGDatxD3mSPG8/72Ka0uuGpGHrwh6N718ZCLCOkOLwmM defin@doretta"
    ];
  };
nix.settings.allowed-users = ["@builders" "@wheel"];
}
