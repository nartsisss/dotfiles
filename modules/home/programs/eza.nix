{
  programs.eza = {
    enable = true;
    enableZshIntegration = true;

    git = true;
    icons = "auto";

    extraOptions = [
      "--color=always"
      "--long"
    ];
  };
}
