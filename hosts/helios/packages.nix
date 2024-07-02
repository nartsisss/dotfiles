{
  alejandra,
  system,
  ...
}: {
  environment.systemPackages = [
    alejandra.defaultPackage.${system}
  ];
}
