{
    # Just some quirked up name because silly shit like this is most of the fun in programming
    description = "Overlord";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-24.05";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager/a631666";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

   # If you yourself aren't part of what contributes to the output is this even reality?
    outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, ...}: with inputs;
    let
       nix.settings.experimental-features = ["nix-command" "flakes"];
    in{
        # Not sure if anything else goes in here but all of the individual computers do. Seems like the patern is to start with a hostname that forms a little block for lack of a better term.
        # Then that block always equals the nixpkg nixSystem weirdness because otherwise i dont think you get to use the nix repo or any of the nix commands which is pretty important.
        # Inside the bock of the hostname we specify the system which is actually the architecture of the cpu used "aarch64-linux" "riscv64-linux" "x86_64-linux" are probably the only ones i'll end up using.
        # It also looks like some inputs might need to be made and later referenced again in the modules section for the raspberry pi to work.
        # The modules section is just a list of files that will be referenced and loaded for that systems config. I can use that to separate individual programs or groups of programs like say obs and kdenlive to only be on my main desktop and maybe the steam deck since those are the only systems that will have both a gui and the power nescesary to do video recording/editing.
        nixosConfigurations = {
            Tarnished = nixpkgs.lib.nixosSystem rec {
                system = "x86_64-linux";
                specialArgs = {
                    pkgs-unstable = import nixpkgs-unstable {
                        inherit system;
                        config.allowUnfree = true;
                    };
                };
                modules = [
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.users.allthebeans = import ./Modules/Gui/home.nix;
                    }
                    ./Modules/allow-unfree.nix
                    ./Systems/Gaming-Desktop/configuration.nix
                    ./Modules/Games/steam.nix
                    ./Modules/Gui/general.nix
                    ./Modules/Users/allthebeans.nix
                    ./Modules/utilities.nix
                    ./Modules/Hardware/nvme.nix
                    ./Modules/Games/minecraft.nix
                    ./Modules/Hardware/nvidia.nix
                    ./Modules/Gui/unstable.nix
                    ./Modules/Gui/emacs.nix
                    ./Modules/Gui/heavy.nix
                ];
            };

            Malenia = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.users.allthebeans = import ./Modules/Gui/home.nix;
                    }
                    ./Modules/Gui/emacs.nix
                    ./Systems/Laptop/configuration.nix
                    ./Modules/Gui/general.nix
                    ./Modules/Hardware/nvme.nix
                    ./Modules/utilities.nix
                    ./Modules/Users/allthebeans.nix
                    ./Modules/docker.nix
                ];

            };

            Radahn = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    ./Systems/Radahn/configuration.nix
                    ./Modules/utilities.nix
                    ./Modules/Users/allthebeans.nix
                    ./Modules/Users/defin.nix
                    ./Modules/docker.nix
                    ./Modules/Servers/server-utils.nix
                ];

            };

            Blaidd = nixpkgs.lib.nixosSystem {
                system =  "aarch64-linux";
                modules = [
                    ./Systems/Raspberry/configuration.nix
                    ./Modules/utilities.nix
                    ./Modules/Users/allthebeans.nix
                    ./Modules/docker.nix
                    ./Modules/Servers/vpn-client.nix
                    ./Modules/Servers/nfs-client.nix
                    ./Modules/Servers/server-utils.nix
                ];
            };

            Jar-bairn = nixpkgs.lib.nixosSystem {
                system = "aarch64-linux";
                modules = [
                    ./Systems/Raspberry2/configuration.nix
                    ./Modules/utilities.nix
                    ./Modules/Users/allthebeans.nix
                    ./Modules/docker.nix
                    ./Modules/Servers/vpn-serv.nix
                    ./Modules/Servers/server-utils.nix
                ];
            };

        };
# My text editor knows where all the magic semicolons go which is pretty pog honestly.
    };
}
