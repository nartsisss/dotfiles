{
  description = "nartsiss's Nix flake configuration";

  inputs = {
    #pkgs
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-24.05";
    #darwin
    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-homebrew = {
      url = "github:zhaofengli/nix-homebrew";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #hm and modules
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-db = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-catppuccin.url = "github:catppuccin/nix";

    #other
    agenix = {
      url = "github:yaxitech/ragenix";
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
