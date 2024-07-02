{
  imports = [
    ./users
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
}
