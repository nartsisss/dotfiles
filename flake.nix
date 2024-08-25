{
  description = "nartsiss's Nix flake configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
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

  outputs =
    inputs:
    let
      configurations = import ./hosts inputs;
    in
    {
      #nixosModules.default = ./modules/nixos;
      darwinModules.default = ./modules/darwin;
      homeManagerModules.default = ./modules/home;

      #nixosConfigurations = configurations.nixosConfigurations;
      darwinConfigurations = configurations.darwinConfigurations;
      #homeManagerConfigurations = configurations.homeManagerConfigurations;
    };
}
