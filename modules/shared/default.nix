{ lib, pkgs, ... }:
{
  imports = [
    ./users
    ./env.nix
  ];

  nix = {
    gc.automatic = true;

    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
  };

  programs.zsh.enable = true;

  fonts = (lib.mkIf pkgs.stdenv.isLinux { fontDir.enable = true; }) // {
    packages = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "JetbrainsMono"
          "NerdFontsSymbolsOnly"
        ];
      })
    ];
  };
}
