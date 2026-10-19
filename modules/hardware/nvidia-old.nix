{ config, pkgs, ... }: {
  # for Nvidia GPU
  #
  # This seems to be implied by modesetting.enable = true; but leaving it here just in case.
  # boot.kernelModules = [ "nvidia" "nvidia_uvm" "nvidia_drm" "nvidia_modeset" ];

  environment.systemPackages = with pkgs; [
    nvtopPackages.nvidia
  ];

  boot.kernelPackages = pkgs.linuxPackages;
  services.xserver.videoDrivers = ["nvidia"]; # will install nvidia-vaapi-driver by default.
  hardware.nvidia-container-toolkit.enable = true;
  hardware.nvidia-container-toolkit.mount-nvidia-executables = true;
  hardware.nvidia = {
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.legacy_580;
    # Modesetting is needed for most Wayland compositors
    modesetting.enable = true;
    # Use the open source version of the kernel module
    # Only available on driver 515.43.04+
    open = false;
    nvidiaSettings = false;
    powerManagement.enable = false;

  };
  services.udev.packages = [
    (pkgs.writeTextFile {
      name = "k3s-gpu";
      text = ''
           {{ template "base" . }}

           [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia]
            privileged_without_host_devices = false
            runtime_engine = ""
            runtime_root = ""
            runtime_type = "io.containerd.runc.v2"
      '';
      destination ="/var/lib/rancher/k3s/agent/etc/containerd/config.toml.tmpl";
    })
  ];
    
  hardware.graphics = {
    enable = true;
    # if hardware.opengl.driSupport is enabled, mesa is installed and provides Vulkan for supported hardware.
    # needed by nvidia-docker and also steam
    enable32Bit = true;
  };
}
