{
  description = "My NixOS configuration";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

  inputs.unstable.url = "github:nixos/nixpkgs/nixos-unstable";

  inputs.snowfall-lib = { url = "github:snowfallorg/lib"; };

  inputs.home-manager = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
      user = "abhalala";
    in {

      nixosConfigurations.murphy = nixpkgs.lib.nixosSystem {

        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs system;
        };

        modules = [ ./nixos/murphy/configuration.nix ];

      };

      nixosConfigurations.ziggy = nixpkgs.lib.nixosSystem {

        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs system;
        };

        modules = [ ./nixos/ziggy/configuration.nix ];

      };

      nixosConfigurations.franky = nixpkgs.lib.nixosSystem {

        specialArgs = {
          pkgs-stable = import nixpkgs-stable {
            inherit system;
            config.allowUnfree = true;
          };
          inherit inputs system;
        };

        modules = [ ./nixos/ziggy/configuration.nix ];

      };

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home-manager/home.nix ];
      };

    };

}
