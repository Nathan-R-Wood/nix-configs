{ nix-doom-emacs, pkgs, ... }: {
    environment.systemPackages =
        let
            doom-emacs = nix-doom-emacs.packages.${system}.default.override {
                doomPrivateDir = ./doom.d;
            };
        in [
            doom-emacs
        ];
}
