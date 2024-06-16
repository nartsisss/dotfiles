{
  description = "nartsiss's nix flakes";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, ... }: {
    darwinConfigurations.helios = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
      
      modules = [
        home-manager.darwinModules.home-manager
        ./hosts/darwin
        ./home/darwin
      ];
    };
  };
}
