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

    #gui
    spacedrive

    #lsp for helix and vscode
    nil
  ];
}
