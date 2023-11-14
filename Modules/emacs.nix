{ inputs, config, nix-doom-emacs, pkgs, ... }: {
    environment.systemPackages =
        let
            doom-emacs = nix-doom-emacs.packages.default.override {
                doomPrivateDir = ./doom.d;
            };
        in [
            doom-emacs
        ];
}
