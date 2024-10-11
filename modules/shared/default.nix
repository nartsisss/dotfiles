{
  lib,
  pkgs,
  ...
}:
{
  imports = [ ./users ];

  nix = {
    gc.automatic = true;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    settings = {
      trusted-users = [
        "@admin"
        "nartsiss"
      ];

      trusted-substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];

      substituters = [
        "https://cache.nixos.org"
        "https://nix-community.cachix.org"
      ];

      trusted-public-keys = [
        "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      ];
    };
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  programs.zsh.enable = true;

  fonts = {
    fontDir.enable = lib.mkIf pkgs.stdenv.isLinux true;
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "JetBrainsMono"
          "NerdFontsSymbolsOnly"
        ];
      })
    ];
  };
}
