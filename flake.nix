{
  description = "Tommy's Nixos Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
    };
    probe-rs-rules = {
      url = "github:jneem/probe-rs-rules";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      probe-rs-rules,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            ./modules/desktop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.tommy = import ./home/tommy.nix;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
        laptop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./modules/laptop/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.tommy = import ./home/tommy.nix;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
        server = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./modules/server/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                users.tommy = import ./home/tommy.nix;
                backupFileExtension = "backup";
                extraSpecialArgs = { inherit inputs; };
              };
            }
          ];
        };
      };
    };
}
