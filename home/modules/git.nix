{ config, ... }:

{
  programs = {
    git = {
      enable = true;
      
      delta.enable = true;

      userName = "nartsisss";
      userEmail = "nartsiss@proton.me";

      ignores = [
        ".DS_Store"
      ];

      extraConfig = {
        init.defaultBranch = "main";
        
        gpg.format = "ssh";
      };

      signing = {
        signByDefault = true;
        key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
      };
    };

    gh = {
      enable = true;

      gitCredentialHelper.enable = true;
    };
  };
}
