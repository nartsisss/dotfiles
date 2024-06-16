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
  };
  
  security.pam.enableSudoTouchIdAuth = true;
}
