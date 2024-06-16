{
  programs.alacritty = {
    enable = true;

    settings = {
      window = {
        padding = {
          x = 10;
          y = 10;
        };

        decorations = "Buttonless";

        opacity = 0.8;

        blur = true;
      };

      font = {
        normal.family = "JetbrainsMono NF";
        size = 14;
      };
    };
  };
}
