{config, ...}: {
  home = {
    sessionPath = [
      "${config.home.homeDirectory}/.cargo/bin"
    ];
  };
}
