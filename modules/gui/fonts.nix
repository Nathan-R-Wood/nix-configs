{ inputs, config, pkgs, ... }: {
  fonts.packages = with pkgs; [
    pkgs.nerd-fonts.symbols-only
  ];
}
