{ config, pkgs, ... }:

{
  imports = [
    ../.
    ../../modules/variables/x1.nix
  ];
}
