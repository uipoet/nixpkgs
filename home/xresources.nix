{ config, pkgs, ... }:

{
  xresources.properties = {
    "Xcursor.size" = config.variables.cursorSize;
    "Xcursor.theme" = "Aiki";
    "Xft.antialias" = true;
    "Xft.autohint" = true;
    "Xft.dpi" = config.variables.dpi;
    "Xft.hinting" = true;
    "Xft.rgba" = "rgb";
  };
}
