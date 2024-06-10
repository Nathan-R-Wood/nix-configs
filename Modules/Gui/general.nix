{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        qmk
        brave
        element-desktop
        discord
    ];
    # Configure keymap in X11 xWayland also requires this atleast from what i can find.
    services.xserver = {
        xkb.layout = "us";
        xkb.variant = "";
    };
    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
}
