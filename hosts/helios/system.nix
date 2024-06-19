{
  system = {
    defaults = {
      LaunchServices = {
        LSQuarantine = false;
      };

      dock = {
        autohide = true;
        show-recents = false;
        orientation = "bottom";
      };

      NSGlobalDomain = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
      };
    };

    stateVersion = 4;
  };
  
  security.pam.enableSudoTouchIdAuth = true;
}
