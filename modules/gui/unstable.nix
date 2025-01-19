{ pkgs-unstable , ... }:
{
    environment.systemPackages = with pkgs-unstable; [
        prusa-slicer
    ];
}
