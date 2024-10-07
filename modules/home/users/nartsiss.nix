{ config, ... }:
{
  programs.git = {
    userName = "nartsisss";
    userEmail = "nartsiss+git@proton.me";

    signing = {
      key = "${config.home.homeDirectory}/.ssh/git_ed25519";
    };
  };
}
