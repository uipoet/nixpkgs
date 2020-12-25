{ config, pkgs, ... }:

{
  fonts = {
    fontconfig = {
      antialias = true;
      defaultFonts = {
        emoji = [ "Hack NF FC Ligatured CCG Regular" ];
        monospace = [ "Hack NF FC Ligatured CCG Regular" ];
        sansSerif = [ "Hack NF FC Ligatured CCG Regular" ];
        serif = [ "Hack NF FC Ligatured CCG Regular" ];
      };
      hinting = {
        autohint = true;
        enable = true;
      };
      subpixel.rgba = "rgb";
    };
    fonts = with pkgs; [
      hack-ligatured
    ];
  };
}
