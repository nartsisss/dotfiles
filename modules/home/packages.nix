{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #utils
    hyperfine
    procs
    sd
    bandwhich
    stable.silicon
    onefetch
    asciinema
    dust
    hexyl
    pastel

    #net
    shadowsocks-rust

    #lsp for helix and vscode
    nil
  ];
}
