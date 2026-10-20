{ config, pkgs, ... }: {
  
  services.k3s = {
    enable = true;
    role = "server";
    tokenFile = "/home/allthebeans/.k3s-token";
    serverAddr = "https://jar-bairn.tailcbbdd7.ts.net:6443";
    extraFlags = [
      "--flannel-backend=wireguard-native"
    ];
    containerdConfigTemplate = ''
      {{ template "base" . }}
      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia]
        privileged_without_host_devices = false
        runtime_engine = ""
        runtime_root = ""
        runtime_type = "io.containerd.runc.v2"
      [plugins."io.containerd.grpc.v1.cri".containerd.runtimes.nvidia.options]
        BinaryName = "${pkgs.nvidia-container-toolkit.tools}/bin/nvidia-container-runtime.cdi"
    ''; 
  };
  
}
