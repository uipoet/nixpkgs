{ config, ... }:

{
  imports = [ ./options.nix ];

  variables = {
    borderWidth = 2;
    bar = {
      borderWidth = 8;
      fontSize = 32;
    };
    cursorSize = 48;
    dpi = 240;
    hostName = "x1";
    spectrwm = '''';
  };
}
