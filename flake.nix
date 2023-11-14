{
    # Just some quirked up name because silly shit like this is most of the fun in programming
    description = "Overlord";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-23.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    };

   # If you yourself aren't part of what contributes to the output is this even reality?
    outputs = inputs@{ self, ...}: with inputs; {
        # Not sure if anything else goes in here but all of the individual computers do. Seems like the patern is to start with a hostname that forms a little block for lack of a better term.
        # Then that block always equals the nixpkg nixSystem weirdness because otherwise i dont think you get to use the nix repo or any of the nix commands which is pretty important.
        # Inside the bock of the hostname we specify the system which is actually the architecture of the cpu used "aarch64-linux" "riscv64-linux" "x86_64-linux" are probably the only ones i'll end up using.
        # It also looks like some inputs might need to be made and later referenced again in the modules section for the raspberry pi to work.
        # The modules section is just a list of files that will be referenced and loaded for that systems config. I can use that to separate individual programs or groups of programs like say obs and kdenlive to only be on my main desktop and maybe the steam deck since those are the only systems that will have both a gui and the power nescesary to do video recording/editing.
        nixosConfigurations = {
            Tarnished = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                # Doom emacs testing
                specialArgs = { inherit nix-doom-emacs system; };
                modules = [
                ./Systems/Gaming-Desktop/configuration.nix
                ./Modules/steam.nix
                ./Modules/general-gui.nix
                ./Modules/user.nix
                ./Modules/utilities.nix
                ./Modules/emacs.nix
                # ./Modules/unstable-gui.nix
                ];
            };
        };
# My text editor knows where all the magic semicolons go which is pretty pog honestly.
    };
}
