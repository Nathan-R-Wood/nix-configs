{ pkgs-unstable , ... }:
{
    environment.systemPackages = with pkgs-unstable; [
        prusa-slicer
       #(pkgsRocm.blender.override {
       #     cudaSupport = true;
       #})
       #cudaPackages.cudatoolkit
       pkgsRocm.blender
    ];
    
    programs.coolercontrol.enable = true;

    users.groups.dialout.members = [ "allthebeans" ]; #for prusa firmware updates
}
