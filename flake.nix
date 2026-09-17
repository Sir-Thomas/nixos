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
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./modules/desktop/configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.tommy = import ./home/tommy.nix;
              backupFileExtension = "backup";
	      extraSpecialArgs = {inherit inputs;};
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
	      extraSpecialArgs = {inherit inputs;};
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
	      extraSpecialArgs = {inherit inputs;};
	    };
	  }
	];
      };
    };
  };
}
