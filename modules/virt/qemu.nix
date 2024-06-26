{ config, pkgs, ... }: {
   environment.systemPackages = with pkgs; [
      qemu
   ];

   # For podman multiarch builds
   boot.binfmt.emulatedSystems = [
      "aarch64-linux"
   ];
}
