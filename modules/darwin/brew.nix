let
  greedyCasks = [
    "discord"
    "spotify"
    "telegram-desktop"
    "firefox"
    "minecraft"
    "termius"
    "vmware-fusion"
    "raycast"
  ];
  casks = [
    "battery"
    "cloudflare-warp"
    "obs"
    "proxifier"
    "termius"
    "vmware-fusion"
  ];
in
{
  environment.systemPath = [ "/opt/homebrew/bin" ];

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
