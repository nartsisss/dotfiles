{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #utils
    hyperfine
    procs
    sd
    bandwhich
    silicon
    onefetch
    asciinema
    dust
    hexyl
    pastel

    #secrets
    agenix

    #net
    shadowsocks-rust

    #lsp for helix and vscode
    nil
  ];
}
