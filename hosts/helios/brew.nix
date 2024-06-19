{
  homebrew = {
    enable = true;

    onActivation = {
      upgrade = true;
      autoUpdate = true;
      cleanup = "zap";
    };

    global = {
      autoUpdate = true;
      brewfile = true;
      lockfiles = true;
    };

    brews = [];

    casks = [
      "battery"
      "cloudflare-warp"
      "discord"
      "docker"
      "google-chrome"
      "jetbrains-toolbox"
      "minecraft"
      "obs"
      "proxifier"
      "raycast"
      "spotify"
      "telegram-desktop"
      "termius"
      "vmware-fusion"
    ];
  };
}
