{ config, pkgs, ... }:

{
  boot.kernelModules = [ "thinkpad_acpi" "thinkpad_hwmon" ];

  hardware = {
    trackpoint = {
      device = "TPPS/2 Elan Touchpoint";
      emulateWheel = true;
      enable = true;
    };
  };

  imports = [
    ../common.nix
    ../cpu/intel.nix
  ];


  services = {
    fprintd.enable = true; # add one with `fprintd-enroll`
    throttled.enable = true;
    xserver = {
      libinput.touchpad.naturalScrolling = true;
      xkbModel = "thinkpad";
    };
  };
}
