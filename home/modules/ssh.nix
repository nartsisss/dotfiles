{
  programs.ssh = {
    enable = true;
    
    addKeysToAgent = "confirm";

    extraConfig = ''
      Host github.com
        AddKeysToAgent yes
        UseKeychain yes
        IdentityFile ~/.ssh/id_ed25519
    '';
  };
}
