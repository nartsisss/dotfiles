{ config, ... }:
let
  user = "nartsisss";
  email = "nartsiss+git@proton.me";
  sshDir = "${config.home.homeDirectory}/.ssh";
in
{
  home.file.".ssh/allowed_signers".text = "${email} ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDebH/0Iba+BpJIQvp40o+zEciq4q/0leIh4XFO2K7fs";

  programs = {
    git = {
      userName = user;
      userEmail = email;

      signing = {
        key = "${sshDir}/git_ed25519";
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
