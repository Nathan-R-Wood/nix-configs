{ config, pkgs, ... }: {
  services.speechd.enable = false;
  hardware.graphics.enable = false;
  services.pipewire.enable = false;
  services.libimput.enable = false;
}
