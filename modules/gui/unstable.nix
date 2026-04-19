{ pkgs-unstable , ... }:
{
    environment.systemPackages = with pkgs-unstable; [
        prusa-slicer
       (pkgsRocm.blender.override {
            cudaSupport = true;
       })
       cudaPackages.cudatoolkit
    ];

    users.groups.dialout.members = [ "allthebeans" ]; #for prusa firmware updates
}
