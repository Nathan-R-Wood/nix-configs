{ config, pkgs, ... }: {
  overlays = [
    (import nixpkgs-unstable { allowUnstable = true; }) {
      name = "unstable"
    }
  ]
}
