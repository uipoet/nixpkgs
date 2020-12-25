{ config, pkgs, ... }:
let
  unstable = import <unstable> { };
in
{
  nixpkgs = {
    config.allowUnfree = true;
    overlays = [
      (self: super: {
        aiki-gtk-theme = super.callPackage ./aiki-gtk-theme.nix { };
        hack-ligatured = super.callPackage ./hack-ligatured.nix { };
      })
    ];
  };
}
