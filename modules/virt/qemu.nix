{ config, pkgs-unstable, lib, ... }: {
   environment.systemPackages = with pkgs-unstable; [
      qemu
   ];

   # For podman multiarch builds
   boot.binfmt.emulatedSystems = ["aarch64-linux"];
   boot.binfmt.registrations.aarch64-linux = {
      interpreter = "${pkgs-unstable.pkgsStatic.qemu-user}/bin/qemu-aarch64";
      wrapInterpreterInShell = false;
      fixBinary = true;
      openBinary = true;
      matchCredentials = true;
      preserveArgvZero = true;
   };
}
