{
  pkgs,
  home-manager,
  ...
}: let
  username = "nartsiss";
  home =
    if pkgs.stdenv.isDarwin
    then "/Users"
    else "/home";
  homePath = "${home}/${username}";
in {
  users.users.${username} = {
    name = username;
    description = "Daniil Nartsissov";
    home = "${homePath}";
    shell = pkgs.zsh;
  };

  home-manager.users.${username} = {
    home = {
      inherit username;
      homeDirectory = "${homePath}";
    };
  };
}
