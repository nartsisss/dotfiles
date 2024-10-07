{ config, ... }:
{
  programs = {
    git = {
      userName = "nartsisss";
      userEmail = "nartsiss+git@proton.me";

      signing = {
        key = "${config.home.homeDirectory}/.ssh/git_ed25519";
      };
    };

    ssh = {
      extraConfig = ''
        Host github.com
          AddKeysToAgent yes
          UseKeychain yes
          PreferredAuthentications publickey
          IdentityFile ~/.ssh/github_ed25519

        Host gitlab.com
          AddKeysToAgent yes
          UseKeychain yes
          PreferredAuthentications publickey
          IdentityFile ~/.ssh/gitlab_ed25519
      '';
    };
  };
}
