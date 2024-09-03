{ config, pkgs-master, lib, ... }: {
   environment.systemPackages = with pkgs-master; [
      qemu
   ];

   # For podman multiarch builds
   boot.binfmt.emulatedSystems = ["aarch64-linux"];
   boot.binfmt.registrations.aarch64-linux = {
      interpreter = "${pkgs-master.pkgsStatic.qemu-user}/bin/qemu-aarch64";
      wrapInterpreterInShell = false;
      fixBinary = true;
      openBinary = true;
      matchCredentials = true;
      preserveArgvZero = true;
   };
}
