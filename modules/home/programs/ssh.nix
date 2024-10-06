{
  programs.ssh = {
    enable = true;

    addKeysToAgent = "confirm";

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
}
