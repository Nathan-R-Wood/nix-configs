{ nixpkgs-unstable, ... }:
{
    environment.systemPackages = with nixpkgs-unstable; [
        prusa-slicer
        # this package of blender is not cuda compatible need to enable cuda support and use "blender-bin" for optix denoising to work but thats a problem for later.
        blender
    ];
}
