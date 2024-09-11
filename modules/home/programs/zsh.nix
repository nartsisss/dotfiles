{ lib, pkgs, ... }:
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
        (lib.mkIf pkgs.stdenv.isDarwin "macos")
      ];
    };
  };

  home.file.".hushlogin".text = "";
}
