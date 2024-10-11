{
  self,
  nixpkgs,
  nixpkgs-stable,
  nix-darwin,
  nix-homebrew,
  home-manager,
  nix-index-db,
  nix-catppuccin,
  agenix,
  ...
}@inputs:
let
  sharedHomeManagerModules = [
    self.homeManagerModules.default
    nix-index-db.hmModules.nix-index
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
          stablePkgs
          agenix.overlays.default
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
        self.darwinModules.default
        home-manager.darwinModules.default
        nix-homebrew.darwinModules.nix-homebrew
        agenix.darwinModules.default
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
