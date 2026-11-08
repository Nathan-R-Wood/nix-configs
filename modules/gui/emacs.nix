{ inputs, config, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
        emacs
        ripgrep
        coreutils
        fd
        clang
        cmake
        gnumake
        gcc
        libvterm
        libtool
        python314
        python314Packages.grip
        python314Packages.pip
        ispell
    ];
}
