{
  description = "izzy's nixos config";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };
  
  outputs = { self, nixpkgs, home-manager, ...}:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
  {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
	inherit system;
	modules = [
	  ./system/configuration.nix
	];
      };
    };
    homeConfigurations = {
      izzy = home-manager.lib.homeManagerConfiguration {
	inherit pkgs;
	modules = [
	  ./user/home.nix
	];
      };
    };
  };
}
