{pkgs, ...}: {
  imports = [
    ./nartsiss.nix
  ];

  environment.systemPackages = with pkgs; [
    alejandra
  ];
}
