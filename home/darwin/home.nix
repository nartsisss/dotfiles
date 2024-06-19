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
        #todo: use hostname as flake configuration name
        rebuild = "darwin-rebuild switch --flake ~/.nix#helios";
        #todo: use path as variable
        flake = "sudo $EDITOR ~/.nix/flake.nix";
        conf = "sudo $EDITOR ~/.nix/hosts/helios/configuration.nix";
        hm = "sudo $EDITOR ~/.nix/home/darwin/home.nix";
      };
    };
  };
}
