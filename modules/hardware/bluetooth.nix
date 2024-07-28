{config, pkgs, ...}: {
  hardware.bluetooth = {
    enable = true;
    settings = {
      General = {
        ControllerMode = "dual";
      };
      Policy = {
        AutoEnable = "true";
      };
    };
  };
}
