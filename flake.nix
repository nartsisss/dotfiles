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
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nix-darwin, home-manager, rust-overlay, ... }: {
    darwinConfigurations.helios = nix-darwin.lib.darwinSystem {
      system = "aarch64-darwin";

      specialArgs = { inherit rust-overlay; };
      
      modules = [
        home-manager.darwinModules.home-manager
        ./hosts/helios
        ./home/darwin
      ];
    };
  };
}
