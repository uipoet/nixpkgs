{ config, pkgs, ... }:

{
  virtualisation.docker = {
    autoPrune.enable = true;
    enable = true;
    enableOnBoot = true;
  };
}
