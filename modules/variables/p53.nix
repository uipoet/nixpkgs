{ config, pkgs, ... }:

{
  imports = [ ./options.nix ];

  variables = {
    borderWidth = 1;
    bar = {
      borderWidth = 4;
      fontSize = 16;
    };
    cursorSize = 32;
    dpi = 120;
    hostName = "p53";
    spectrwm = ''
      autorun = ws[1]:brave
      autorun = ws[3]:code
      autorun = ws[4]:alacritty
      autorun = ws[2]:spotify
      bar_enabled_ws[1] = 0
      bar_enabled_ws[2] = 1
      bar_enabled_ws[3] = 0
      bar_enabled_ws[4] = 0
      bind[rg_1] = MOD+1
      bind[rg_2] = MOD+2
      bind[rg_3] = MOD+3
      bind[rg_4] = MOD+4
      bind[mvrg_1] = MOD+Shift+1
      bind[mvrg_2] = MOD+Shift+2
      bind[mvrg_3] = MOD+Shift+3
      bind[mvrg_4] = MOD+Shift+4
      layout = ws[1]:0:0:0:0:horizontal
      layout = ws[2]:0:0:0:0:horizontal
      layout = ws[3]:0:0:0:0:horizontal
      layout = ws[4]:0:0:0:0:horizontal
      quirk[Alacritty] = WS[4]
      quirk[Code] = WS[3]
      quirk[Chromium-browser] = WS[1]
      quirk[Spotify] = WS[2]
      region = screen[1]:1440x1440+0+0
      region = screen[1]:2240x1440+1440+0
      region = screen[1]:1440x1440+3680+0
      region = screen[1]:1920x1080+5120+0
      warp_focus = 1
      workspace_clamp = 1
      workspace_limit = 4
    '';
  };
}
