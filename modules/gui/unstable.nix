{ pkgs-unstable , ... }:
{
    environment.systemPackages = with pkgs-unstable; [
        prusa-slicer
    ];

    users.groups.dialout.members = [ "allthebeans" ]; #for prusa firmware updates
}
