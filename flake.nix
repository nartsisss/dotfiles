{
  description = "nartsiss's Nix flake configuration";

  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    lix = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.0.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };
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
    agenix = {
      url = "github:yaxitech/ragenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-catppuccin.url = "github:catppuccin/nix";
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
