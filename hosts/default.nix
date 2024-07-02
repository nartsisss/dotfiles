{
  self,
  nixpkgs,
  nix-darwin,
  home-manager,
  rust-overlay,
  ...
} @ inputs: let
  sharedHomeManagerModules = [
    self.homeManagerModules.default
  ];
  darwinSystem = {
    system,
    darwinModules ? [],
    homeManagerModules ? [],
  }: let
    #todo: make function reusable in other systems, move into lib
    pkgs = import nixpkgs {
      inherit system;
      overlays = [rust-overlay.overlays.default];
      config.allowUnfree = true;
    };
    specialArgs = inputs // {inherit system;};
  in
    nix-darwin.lib.darwinSystem {
      inherit pkgs;
      specialArgs = specialArgs;
      modules =
        [
          home-manager.darwinModules.default
          self.darwinModules.default
          {
            home-manager = {
              extraSpecialArgs = specialArgs;
              sharedModules = homeManagerModules ++ sharedHomeManagerModules;
            };
          }
        ]
        ++ darwinModules;
    };
in {
  darwinConfigurations = {
    helios = darwinSystem {
      system = "aarch64-darwin";
      darwinModules = [
        ./helios
      ];
      homeManagerModules = [
        ../modules/home
      ];
    };
  };
}
