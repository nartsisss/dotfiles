let
  greedyCasks = [
    #"proxifier"
  ];
  casks = [
    "telegram-desktop"
    #"discord"
    "spotify"
    #"raycast"
    "minecraft"
    "battery"
    #"cloudflare-warp"
    "obs"
    #"termius"
    #"vmware-fusion"
  ];
in
{
  environment.systemPath = [ "/opt/homebrew/bin" ];

  environment.variables = {
    HOMEBREW_NO_ENV_HINTS = "1";
    HOMEBREW_NO_ANALYTICS = "1";
    HOMEBREW_BAT = "1";
  };

  nix-homebrew = {
    enable = true;

    #todo configurable
    user = "nartsiss";
  };

  homebrew = {
    enable = true;

    onActivation = {
      upgrade = true;
      autoUpdate = true;
      cleanup = "none";
    };

    global = {
      autoUpdate = true;
      brewfile = true;
      lockfiles = true;
    };

    casks =
      map (name: {
        name = name;
        greedy = true;
      }) greedyCasks
      ++ casks;
  };
}
