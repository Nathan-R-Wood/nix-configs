{ pkgs-unstable , ... }:
{
    environment.systemPackages = with pkgs-unstable; [
        prusa-slicer
        (blender-hip.override {
            cudaSupport = true;
        })
        cudaPackages.cudatoolkit
    ];

    users.groups.dialout.members = [ "allthebeans" ]; #for prusa firmware updates
}
