{
    description = "Manages all of my systems.";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-25.11";
        nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
        nixpkgs-master.url = "github:nixos/nixpkgs/master";
        home-manager.url = "github:nix-community/home-manager/release-25.11";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        raspberry-pi-nix.url = "github:nix-community/raspberry-pi-nix";
        raspberry-pi-nix.inputs.nixpkgs.follows = "nixpkgs";
    };

    nixConfig= {
      extra-substituters = [
        "ssh://malenia.tailcbbdd7.ts.net"
      ];
      extra-trusted-public-keys = [
        "malenia.tailcbbdd7.ts.net:XBIwc+pGC3MPqbQz3qmSnqganQofJ5VhCpYoVB6Fcxg="
      ];
    };

   # If you yourself aren't part of what contributes to the output is this even reality?
    outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, ...}: with inputs; {
        # Not sure if anything else goes in here but all of the individual computers do. Seems like the patern is to start with a hostname that forms a little block for lack of a better term.
        # Then that block always equals the nixpkg nixSystem weirdness because otherwise i dont think you get to use the nix repo or any of the nix commands which is pretty important.
        # Inside the bock of the hostname we specify the system which is actually the architecture of the cpu used "aarch64-linux" "riscv64-linux" "x86_64-linux" are probably the only ones i'll end up using.
        # It also looks like some inputs might need to be made and later referenced again in the modules section for the raspberry pi to work.
        # The modules section is just a list of files that will be referenced and loaded for that systems config. I can use that to separate individual programs or groups of programs like say obs and kdenlive to only be on my main desktop and maybe the steam deck since those are the only systems that will have both a gui and the power nescesary to do video recording/editing.
        nixosConfigurations = {

            Malenia = nixpkgs.lib.nixosSystem rec {
                system = "x86_64-linux";
                specialArgs = {
                    pkgs-unstable = import nixpkgs-unstable {
                        inherit system;
                        config.allowUnfree = true;
                    };
                    pkgs-master = import nixpkgs-master {
                        inherit system;
                        config.allowUnfree = true;
                    };
                };
                modules = [
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.users.allthebeans = import ./modules/home.nix;
                    }
                    ./modules/allow-unfree.nix
                    ./systems/gui/malenia/configuration.nix
                    ./modules/utilities.nix
                    ./modules/users/allthebeans.nix
                    ./modules/games/steam.nix
                    ./modules/games/minecraft.nix
                    ./modules/games/packwiz.nix
                    ./modules/hardware/nvme.nix
                    ./modules/hardware/bluetooth.nix
                    ./modules/gui/de/plasma.nix
                    ./modules/gui/emacs.nix
                    ./modules/gui/fonts.nix
                    ./modules/gui/general.nix
                    ./modules/gui/unstable.nix
                    ./modules/gui/kdepackages.nix
                    ./modules/dev/micro-controller.nix
                    ./modules/dev/networking.nix
                    ./modules/dev/sbc.nix
                    ./modules/virt/qemu.nix
                    ./modules/servers/vault.nix
                    ./modules/servers/container-storage.nix
                ];
            };

            Radahn = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.users.allthebeans = import ./modules/home.nix;
                    }
                    ./systems/headless/radahn/configuration.nix
                    ./modules/utilities.nix
                    ./modules/users/allthebeans.nix
                    ./modules/users/defin.nix
                    ./modules/servers/server-utils.nix
                    ./modules/servers/container-storage.nix
                ];
            };

            Tree-sentinel = nixpkgs.lib.nixosSystem rec {
                system = "x86_64-linux";
                modules = [
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.users.allthebeans = import ./modules/home.nix;
                    }
                    ./systems/headless/tree-sentinel/configuration.nix
                    ./modules/utilities.nix
                    ./modules/users/allthebeans.nix
                    ./modules/servers/server-utils.nix
                    ./modules/allow-unfree.nix
                    ./modules/hardware/nvidia-old.nix
                    ./modules/servers/container-storage.nix
                ];
            };

            Blaidd = nixpkgs.lib.nixosSystem {
                system =  "aarch64-linux";
                modules = [
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.users.allthebeans = import ./modules/home.nix;
                    }
                    ./systems/headless/blaidd/configuration.nix
                    ./modules/utilities.nix
                    ./modules/users/allthebeans.nix
                    ./modules/servers/nfs-client.nix
                    ./modules/servers/server-utils.nix
                    ./modules/servers/vpn-client.nix
                    ./modules/servers/container-storage.nix
                ];
            };

            Jar-bairn = nixpkgs.lib.nixosSystem {
                system = "aarch64-linux";
                modules = [
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.users.allthebeans = import ./modules/home.nix;
                    }
                    ./systems/headless/jar-bairn/configuration.nix
                    ./modules/utilities.nix
                    ./modules/users/allthebeans.nix
                    ./modules/servers/vpn-serv.nix
                    ./modules/servers/server-utils.nix
                    ./modules/servers/container-storage.nix
                ];
            };

            Container-orchestrator = nixpkgs.lib.nixosSystem rec {
                system = "aarch64-linux";
                modules = [
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.users.allthebeans = import ./modules/home.nix;
                    }
                    raspberry-pi-nix.nixosModules.raspberry-pi
                    raspberry-pi-nix.nixosModules.sd-image
                    ./systems/headless/container-orchestrator/configuration.nix
                    ./modules/utilities.nix
                    ./modules/users/allthebeans.nix
                    ./modules/servers/server-utils.nix
                    ./modules/servers/container-storage.nix
                ];
            };

            Iso = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                modules = [
                    "${nixpkgs}/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix"
                    ({pkgs, config, lib, ...}: {services.openssh.settings.PermitRootLogin = lib.mkForce "no";})
                    ./modules/utilities.nix
                    ./modules/users/allthebeans.nix
                ];
            };
        };
    };
}
