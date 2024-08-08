{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #utils
    hyperfine
    procs
    sd
    bandwhich
    onefetch
    silicon
    asciinema
    dust

    #net
    shadowsocks-rust

    #lsp for helix and vscode
    nil
  ];
}
