{
  programs = {
    git = {
      enable = true;

      delta.enable = true;

      ignores = [ ".DS_Store" ];

      extraConfig = {
        init.defaultBranch = "main";

        gpg.format = "ssh";
      };

      signing = {
        signByDefault = true;
      };
    };

    gh = {
      enable = true;

      gitCredentialHelper.enable = true;
    };
  };
}
