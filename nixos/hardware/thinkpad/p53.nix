{ config, lib, pkgs, ... }:

{
  # alacritty won't work without this
  environment.variables.WINIT_X11_SCALE_FACTOR = "1.25";

  imports = [
    ./common.nix
    ../gpu/nvidia
    ../../../modules/variables/p53.nix
  ];

  services = {
    synergy.server = {
      autoStart = true;
      configFile = pkgs.writeText "synergy-server.conf" ''
        section: screens
          p53:
          x1:
        end
        section: aliases
          p53:
            10.0.0.4
          x1:
            10.0.0.8
        end
        section: links
          p53:
            left = x1
          x1:
            right = p53
        end
      '';
      enable = true;
    };
    xserver.deviceSection = ''
      Option "ConnectedMonitor" "DP-3, DP-0"
      Option "MetaModes" "5120x1440, 1920x1080"
      Option "MetaModeOrientation" "DP-0 LeftOf DP-3"
    '';
  };
}
