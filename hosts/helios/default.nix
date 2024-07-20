{
  imports = [ ./system.nix ];

  environment.variables = {
    FLAKE = ".nix#helios";
  };
}
