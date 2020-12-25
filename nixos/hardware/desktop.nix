{ config, pkgs, ... }:

{
  imports = [
    ./common.nix
    ./cpu/intel.nix
  ];
}
