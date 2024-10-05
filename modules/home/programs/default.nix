{
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./eza.nix
    ./fd.nix
    ./fzf.nix
    ./git.nix
    ./helix.nix
    ./ssh.nix
    ./tealdeer.nix
    ./yazi.nix
    ./zellij.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  programs = {
    starship.enable = true;
    bat.enable = true;
    ripgrep.enable = true;
    gitui.enable = true;
    vscode.enable = true;
    nix-index.enable = true;
  };
}
