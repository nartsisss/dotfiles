{ pkgs, ... }:

{
  imports = [
    ../modules 
  ];
  
  home = {
    stateVersion = "24.05";
  };
  
  programs = {
    zsh = {  
      shellAliases = {
        rebuild = "darwin-rebuild switch --flake ~/.nix#macos";
        flake = "sudo $EDITOR ~/.nix/flake.nix";
        conf = "sudo $EDITOR ~/.nix/hosts/darwin/configuration.nix";
        hm = "sudo $EDITOR ~/.nix/home/darwin/home.nix";
      };
    };

    starship.enable = true;
    
    bat.enable = true;

    ripgrep.enable = true;
  };
}
