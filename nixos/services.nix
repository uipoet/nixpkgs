{ config, lib, pkgs, ... }:
with lib;
{
  services = {
    blueman.enable = true;
    dbus = {
      enable = true;
      packages = [ pkgs.gnome3.dconf ];
    };
    gnome = {
      core-os-services.enable = true;
      glib-networking.enable = true;
      gnome-keyring.enable = true;
      gnome-settings-daemon.enable = true;
      sushi.enable = true;
    };
    journald.extraConfig = "SystemMaxUse=500M";
    mysql = {
      enable = true;
      package = pkgs.mysql;
    };
    openssh = {
      challengeResponseAuthentication = false;
      enable = true;
      passwordAuthentication = false;
    };
    printing.enable = true;
    timesyncd.enable = true;
    udev.packages = [ pkgs.gnome3.gnome-settings-daemon ];
    unclutter.enable = false;
    upower.enable = true;
    xserver = {
      autoRepeatDelay = 400;
      autoRepeatInterval = 20;
      autorun = true;
      displayManager = {
        autoLogin = {
          enable = true;
          user = "jamie";
        };
        defaultSession = "none+spectrwm";
        lightdm = {
          enable = true;
          greeters.gtk = {
            cursorTheme = {
              name = "Aiki";
              package = pkgs.aiki-gtk-theme;
              size = config.variables.cursorSize;
            };
            iconTheme = {
              name = "Aiki";
              package = pkgs.aiki-gtk-theme;
            };
            theme = {
              name = "Aiki";
              package = pkgs.aiki-gtk-theme;
            };
            enable = true;
          };
        };
        sessionCommands = ''
          hsetroot -solid #000000
          xrandr --output DP-4 --mode 5120 x1440 --output DP-3 --mode 1920 x1080 --pos 5120 x360
        '';
      };
      dpi = config.variables.dpi;
      enable = true;
      layout = "us";
      libinput = {
        enable = true;
        touchpad = {
          accelSpeed = "0.8";
          disableWhileTyping = true;
        };
      };
      updateDbusEnvironment = true;
      useGlamor = true;
      windowManager.spectrwm.enable = true;
      xkbOptions = "caps:escape,terminate:ctrl_alt_bksp";
    };
  };
}
