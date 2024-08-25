{
  self,
  nixpkgs,
  nixpkgs-stable,
  nix-darwin,
  nix-homebrew,
  home-manager,
  rust-overlay,
  ...
}@inputs:
let
  sharedHomeManagerModules = [ self.homeManagerModules.default ];
  darwinSystem =
    {
      system,
      darwinModules ? [ ],
      homeManagerModules ? [ ],
    }:
    let
      overlays = {
        rust = rust-overlay.overlays.default;
        stable =
          final: prev:
          let
            stablePkgs = nixpkgs-stable;
          in
          {
            stable = stablePkgs.legacyPackages.${system};
          };
      };
      #todo: make function reusable in other systems, move into lib
      pkgs = import nixpkgs {
        inherit system;
        overlays = builtins.attrValues overlays;
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
