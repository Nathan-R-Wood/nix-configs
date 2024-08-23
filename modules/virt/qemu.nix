{ config, pkgs-master, lib, ... }: {
   environment.systemPackages = with pkgs-master; [
      qemu
   ];

   # For podman multiarch builds
   boot.binfmt.registrations = lib.genAttrs ["aarch64-linux" "armv7l-linux" "riscv64-linux"] (sys: {
      interpreter = "${pkgs-master.pkgsStatic.qemu-user}/bin/qemu-${(lib.systems.elaborate sys).qemuArch}";
      wrapInterpreterInShell = false;
      preserveArgvZero = true;
      matchCredentials = true;
      fixBinary = true;
      openBinary = true;
});
}
