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
    ouch

    #secrets
    agenix

    #desktop
    google-chrome
    telegram-desktop

    #todo only for darwin
    raycast
  ];
}
