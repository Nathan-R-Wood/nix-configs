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
        python3
        python312Packages.grip
    ];
}
