{ config, pkgs, ... }:

{
  xdg = {
    autostart.enable = true;
    icons.enable = true;
    mime.enable = true;
    sounds.enable = true;
  };
}
