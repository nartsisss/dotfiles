{
  imports = [
    ./alacritty.nix
    ./direnv.nix
    ./eza.nix
    ./git.nix
    ./gpg.nix
    ./helix.nix
    ./yazi.nix
    ./zellij.nix
    ./zoxide.nix
    ./zsh.nix
  ];

  programs = {
    starship.enable = true;
    bat.enable = true;
    ripgrep.enable = true;
  };
}
