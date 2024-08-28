{
  self,
  lib,
  pkgs,
  ...
}:
{
  imports = [ ./users ];

  nix = {
    gc.automatic = true;

    registry.nixpkgs.flake = self.inputs.nixpkgs;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
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
