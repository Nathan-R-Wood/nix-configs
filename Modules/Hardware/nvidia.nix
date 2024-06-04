{ config, pkgs-unstable, ... }: {
  # for Nvidia GPU

  services.xserver.videoDrivers = ["nvidia"]; # will install nvidia-vaapi-driver by default
  hardware.nvidia = {
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.beta;

    # Modesetting is needed for most Wayland compositors
    modesetting.enable = true;
    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+
    open = true;

    nvidiaSettings = true;


    powerManagement.enable = true;

  };

  # virtualisation.docker.enableNvidia = true; # for nvidia-docker
  virtualisation.podman.enableNvidia = true;

  hardware.opengl = {
    enable = true;
    # if hardware.opengl.driSupport is enabled, mesa is installed and provides Vulkan for supported hardware.
    driSupport = true;
    # needed by nvidia-docker and also steam
    driSupport32Bit = true;
  };
}
