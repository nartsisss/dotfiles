{
  imports = [
    ./users
    ./programs

    ./env.nix
    ./packages.nix
  ];
  catppuccin = {
    enable = true;

    accent = "mauve";
    flavor = "mocha";
  };
}
