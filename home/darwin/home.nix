{pkgs, ...}: {
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
        update = "nix flake update ~/.nix";
        #todo: use path as variable
        flake = "$EDITOR ~/.nix/flake.nix";
        conf = "$EDITOR ~/.nix/hosts/helios/configuration.nix";
        hm = "$EDITOR ~/.nix/home/darwin/home.nix";
      };
    };
  };
}
