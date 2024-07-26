{
  description = "My NixOS configuration";

  inputs = {
    # TODO: Fix this hot mess of using unstable as the primary and make the stable as primary while still keeping unstable as a secondary option "Latest" 
    # Or better, keep stable as the main for critical environments: 
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs = { self, nixpkgs, nixpkgs-stable, home-manager, ... }@inputs:

    let
      system = "x86_64-linux";
      user = "abhalala";
    in
    {

      nixosConfigurations.murphy = nixpkgs.lib.nixosSystem
        {

          specialArgs = {
            pkgs-stable = import nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
            inherit inputs system;
          };

          modules = [
            ./nixos/murphy/configuration.nix
          ];

        };

      nixosConfigurations.ziggy = nixpkgs.lib.nixosSystem
        {

          specialArgs = {
            pkgs-stable = import nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
            inherit inputs system;
          };

          modules = [
            ./nixos/ziggy/configuration.nix
          ];

        };


      nixosConfigurations.franky = nixpkgs.lib.nixosSystem
        {

          specialArgs = {
            pkgs-stable = import nixpkgs-stable {
              inherit system;
              config.allowUnfree = true;
            };
            inherit inputs system;
          };

          modules = [
            ./nixos/ziggy/configuration.nix
          ];

        };

      homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        modules = [ ./home-manager/home.nix ];
      };

    };

}
