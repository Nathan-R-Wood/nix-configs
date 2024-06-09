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
    ];
}
