{
  description = "Tommy's Nixos Configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/desktop.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.tommy = import ./home/home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
      laptop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
	modules = [
	  ./hosts/laptop.nix
	  home-manager.nixosModules.home-manager
	  {
	    home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.tommy = import ./home/home.nix;
              backupFileExtension = "backup";
	    };
	  }
	];
      };
    };
  };
}
