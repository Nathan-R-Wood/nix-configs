{ config, pkgs, ... }: {
  programs.zsh.enable = true;
  users.users.allthebeans = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Some name or something";
    extraGroups = [ "networkmanager" "wheel" "dialout" "adbusers" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDg26eeOJ8a2idJmHGH1/3aApR8nf/kw2QYbNpQ7cjcn wizarddragonpublic@gmail.com"
    ];
  };
}
