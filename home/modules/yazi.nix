{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    settings = {
      manager = {
        sort_by = "natural";
        show_hidden = false;
        sort_dir_first = true;
      };
    };
  };
}
