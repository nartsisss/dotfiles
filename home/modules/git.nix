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
      };
    };

    gh = {
      enable = true;

      gitCredentialHelper.enable = true;
    };
  };
}
