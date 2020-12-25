{ config, pkgs, ... }:

{
  hardware.nvidia.prime.sync.enable = true;

  imports = [ ./common.nix ];
}
