{ config, pkgs, ... }: {
   environment.systemPackages = with pkgs; [
      qemu
   ];
}
