{
  nixpkgs,
  pkgs,
  home-manager,
  ...
}: {
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix = {
    gc = {
      user = "root";
      automatic = true;
    };

    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    settings.allowed-users = ["@admin" "nartsiss"];
  };

  users.users.nartsiss = {
    name = "nartsiss";
    home = "/Users/nartsiss";
  };

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;
}
