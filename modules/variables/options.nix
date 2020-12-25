{ lib, ... }:

{
  options.variables = {
    borderWidth = lib.mkOption { type = lib.types.int; };
    bar = {
      borderWidth = lib.mkOption { type = lib.types.int; };
      fontSize = lib.mkOption { type = lib.types.int; };
    };
    cursorSize = lib.mkOption { type = lib.types.int; };
    dpi = lib.mkOption { type = lib.types.int; };
    hostName = lib.mkOption { type = lib.types.str; };
    spectrwm = lib.mkOption { type = lib.types.str; };
  };
}
