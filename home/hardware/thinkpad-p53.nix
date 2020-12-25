{ config, pkgs, ... }:

{
  imports = [
    ../.
    ../../modules/variables/p53.nix
  ];
}
