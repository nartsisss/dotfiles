{
  imports = [
    ../shared
    ./brew.nix
    ./env.nix
  ];

  services.nix-daemon.enable = true;

  system = {
    defaults.LaunchServices.LSQuarantine = false;

    stateVersion = 4;
  };

  security.pam.enableSudoTouchIdAuth = true;
}
