{ config, pkgs, ... }: {

    environment.systemPackages = with pkgs; [
        qmk
        brave
        element-desktop
        discord
        #signal-desktop
        wayland-utils
        hardinfo2
        logseq
        calibre
        onefetch # neofetch for git
        streamlink # pipe video from online into a local player
        ffmpeg
        mpv
    ];
    # Configure keymap in X11 xWayland also requires this atleast from what i can find.
    services.xserver = {
        xkb.layout = "us";
        xkb.variant = "";
    };
    # Enable sound with pipewire.
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
        enable = true;
        alsa.enable = true;
        alsa.support32Bit = true;
        pulse.enable = true;
    };
}
