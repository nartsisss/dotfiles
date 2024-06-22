{ nixpkgs, rust-overlay, ... }:

{
  nixpkgs.overlays = [
    rust-overlay.overlays.default
  ];
}
