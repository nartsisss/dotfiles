{
  self,
  nixpkgs,
  nixpkgs-stable,
  lix,
  nix-darwin,
  nix-homebrew,
  home-manager,
  nix-catppuccin,
  ...
}@inputs:
let
  sharedHomeManagerModules = [
    self.homeManagerModules.default
    nix-catppuccin.homeManagerModules.catppuccin
  ];
  darwinSystem =
    {
      system,
      darwinModules ? [ ],
      homeManagerModules ? [ ],
    }:
    let
      stablePkgs = final: prev: {
        stable = nixpkgs-stable.legacyPackages.${system};
      };
      #todo: make function reusable in other systems, move into lib
      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          lix.overlays.default
          stablePkgs
        ];
        config.allowUnfree = true;
      };
      specialArgs = inputs // {
        inherit system;
      };
    in
    nix-darwin.lib.darwinSystem {
      inherit pkgs;
      specialArgs = specialArgs;
      modules = [
        lix.nixosModules.default
        self.darwinModules.default
        home-manager.darwinModules.default
        nix-homebrew.darwinModules.nix-homebrew
        {
          home-manager = {
            extraSpecialArgs = specialArgs;
            sharedModules = homeManagerModules ++ sharedHomeManagerModules;
          };
        }
      ] ++ darwinModules;
    };
in
{
  darwinConfigurations = {
    helios = darwinSystem {
      system = "aarch64-darwin";
      darwinModules = [ ./helios ];
      homeManagerModules = [ ../modules/home ];
    };
  };
}
