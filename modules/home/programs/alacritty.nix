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

        blur = true;
      };

      font = {
        normal.family = "JetbrainsMono NF";
        size = 14;
      };
    };
  };
}
