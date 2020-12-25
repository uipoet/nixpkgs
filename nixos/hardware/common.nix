{ config, pkgs, ... }:

{
  boot = {
    extraModulePackages = with config.boot.kernelPackages; [ acpi_call ];
    kernel.sysctl."vm.swappiness" = 1;
    kernelModules = [ "acpi_call" ];
  };

  environment.systemPackages = with pkgs; [
    acpilight
  ];

  hardware = {
    acpilight.enable = true;
    bluetooth.enable = true;
    opengl = {
      driSupport32Bit = true;
      enable = true;
      extraPackages = with pkgs; [
        intel-media-driver
        libvdpau-va-gl
        vaapiIntel
        vaapiVdpau
      ];
      extraPackages32 = with pkgs.pkgsi686Linux; [
        vaapiIntel
      ];
    };
    pulseaudio = {
      enable = true;
      support32Bit = true;
    };
  };

  services.fstrim.enable = true;
}
