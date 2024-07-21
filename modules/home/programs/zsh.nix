{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    oh-my-zsh = {
      enable = true;

      plugins = [
        "sudo"
        "macos"
      ];
    };
  };

  home.file.".hushlogin".text = "";
}
