{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;

    git = true;
    icons = true;

    extraOptions = [
      "--color=always"
      "--long"
    ];
  };
}
