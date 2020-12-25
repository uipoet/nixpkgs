{ config, pkgs, ... }:

{
  boot = {
    kernelParams = [ "quiet" ];
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = true;
    };
  };
}
