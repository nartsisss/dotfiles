{ lib, pkgs, ... }:
{
  home.shellAliases = {
    flake = "nix flake";
    gc = "nix-collect-garbage -d";
    #todo nixos-rebuild
    rebuild = lib.mkIf pkgs.stdenv.isDarwin "darwin-rebuild switch --flake ~/$FLAKE";
  };
}
