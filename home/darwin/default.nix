{
  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    users.nartsiss.imports = [./home.nix];
  };
}
