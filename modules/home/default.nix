{ lib, pkgs, ... }:
{
  imports = [
    ./users
    ./programs

    ./packages.nix
  ];

  catppuccin = {
    enable = true;

    flavor = "mocha";
  };

  home.shellAliases = {
    flake = "nix flake";
    gc = "nix-collect-garbage -d";
    #todo nixos-rebuild
    rebuild = lib.mkIf pkgs.stdenv.isDarwin "darwin-rebuild switch --flake ~/$FLAKE";
  };
}
