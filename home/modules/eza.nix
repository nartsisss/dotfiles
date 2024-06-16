{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;

    git = true;
    icons = true;

    extraOptions = [
      "--color always"
      "--long"
      "--no-filesize"
      "--no-time"
      "--no-user"
      "--no-permissions"
    ];
  };
}
