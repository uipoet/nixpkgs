{ config, lib, pkgs, ... }:
let
  oled-brightness = pkgs.writeShellScriptBin "oled-brightness" ''
    BACKLIGHT_PATH="/sys/class/backlight/intel_backlight"
    MAX_BRIGHTNESS=$(cat $BACKLIGHT_PATH/max_brightness)

    sync-brightness () {
      ACTUAL_BRIGHTNESS=$(cat $BACKLIGHT_PATH/actual_brightness)
      BRIGHTNESS=$(echo "$ACTUAL_BRIGHTNESS / $MAX_BRIGHTNESS * 0.9 + 0.1" | bc -l)
      xrandr --output eDP-1 --brightness $BRIGHTNESS
    }

    sync-brightness

    inotifywait --event modify --monitor --quiet $BACKLIGHT_PATH/actual_brightness | while read line
    do
      sync-brightness
    done
  '';
in
{
  boot.initrd.availableKernelModules = [ "battery" ];

  environment = {
    variables = {
      # hidpi hack for GDK apps on OLED
      # GDK_DPI_SCALE = "0.5";
      # GDK_SCALE = "2";
      # alacritty won't work without this
      WINIT_X11_SCALE_FACTOR = "2.5";
    };
  };

  imports = [
    ./common.nix
    ../gpu/nvidia/prime/offload.nix
    ../../../modules/variables/x1.nix
  ];

  services.synergy.client = {
    autoStart = true;
    enable = true;
    serverAddress = "p53.local";
  };

  systemd = {
    extraConfig = ''
      DefaultLimitNOFILE=1048576
      DefaultTimeoutStartSec=10s
      DefaultTimeoutStopSec=10s
    '';

    user.services = {
      oled-brightness = {
        partOf = [ "graphical-session.target" ];
        path = with pkgs; [
          bc
          inotify-tools
          xorg.xrandr
        ];
        script = "${oled-brightness}/bin/oled-brightness";
        serviceConfig = {
          PassEnvironment = "DISPLAY";
          Restart = "always";
          RestartSec = 3;
        };
        wantedBy = [ "graphical-session.target" ];
      };
    };
  };
}
