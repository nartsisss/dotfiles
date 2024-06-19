{ nixpkgs, pkgs, home-manager, ... }:

{
  nixpkgs.hostPlatform = "aarch64-darwin";

  nix = {
    package = pkgs.nix;

    gc = {
      user = "root";
      automatic = true;
      interval = { Weekday = 0; Hour = 2; Minute = 0; };
    };
    
    extraOptions = ''
      experimental-features = nix-command flakes
    '';

    settings = {
      allowed-users = [ "@admin" "nartsiss" ];
    };
  };

  users.users.nartsiss = {
    name = "nartsiss";
    home = "/Users/nartsiss";
  };

  services.nix-daemon.enable = true;

  programs.zsh.enable = true;
}
