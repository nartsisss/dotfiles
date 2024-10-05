{ pkgs, ... }:
{
  home.packages = with pkgs; [
    #cli
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
  ];
}
