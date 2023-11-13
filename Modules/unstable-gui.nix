{ nixpkgs-unstable, pkgs, ... }:
{
# I hate everything going on here but it seems to work so it must stay :(
    nixpkgs.overlays = [
        (final: prev: {
            inherit (nixpkgs-unstable.legacyPackages.${pkgs.system}) prusa-slicer;
            inherit (nixpkgs-unstable.legacyPackages.${pkgs.system}) blender;
        })
        # this package of blender is not cuda compatible need to enable cuda support and use "blender-bin" for optix denoising to work but thats a problem for later.
    ];
}
