{ lib, pkgs, ... }:
{
  home.shellAliases = {
    flake = "nix flake";
    gc = "nix store gc";
    #todo nixos-rebuild
    rebuild = lib.mkIf pkgs.stdenv.isDarwin "darwin-rebuild switch --flake ~/$FLAKE";
  };
}