{
  description = "Daniil Nartsissov's (nartsiss's) Nix configurations";

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
    alejandra = {
      url = "github:kamadorueda/alejandra";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: let
    configurations = import ./hosts inputs;
  in {
    #nixosModules.default = ./modules/nixos;
    darwinModules.default = ./modules/darwin;
    homeManagerModules.default = ./modules/home;

    #nixosConfigurations = configurations.nixosConfigurations;
    darwinConfigurations = configurations.darwinConfigurations;
    #homeManagerConfigurations = configurations.homeManagerConfigurations;
  };
}
