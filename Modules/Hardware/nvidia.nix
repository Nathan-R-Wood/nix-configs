{ config, pkgs-unstable, ... }: {
  # for Nvidia GPU
  boot.kernelModules = [ "nvidia" "nvidia_uvm" "nvidia_drm" "nvidia_modeset" ];
  boot.kernelPackages = pkgs-unstable.linuxPackages_latest;
  services.xserver.videoDrivers = ["nvidia"]; # will install nvidia-vaapi-driver by default.
  hardware.nvidia-container-toolkit.enable = true;
  hardware.nvidia = {
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    # Modesetting is needed for most Wayland compositors
    modesetting.enable = true;
    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+
    open = false;
    nvidiaSettings = true;
    powerManagement.enable = true;

  };

  hardware.opengl = {
    enable = true;
    # if hardware.opengl.driSupport is enabled, mesa is installed and provides Vulkan for supported hardware.
    driSupport = true;
    # needed by nvidia-docker and also steam
    driSupport32Bit = true;
  };
}
