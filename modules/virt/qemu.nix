{ config, pkgs-unstable, lib, ... }: {
   environment.systemPackages = with pkgs-unstable; [
      qemu
   ];

   # For podman multiarch builds
   boot.binfmt = {
      emulatedSystems = [ "aarch64-linux" ];
      preferStaticEmulators = true;
   };

   users.groups.kvm.members = [ "allthebeans" ];
}
