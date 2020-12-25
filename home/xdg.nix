{ config, ... }:

{
  xdg = {
    configFile = {
      "spectrwm/spectrwm.conf" = {
        text = ''
          bar_action = spectrwm-baraction
          bar_action_expand = 1
          bar_at_bottom = 1
          bar_border_unfocus[1] = rgb:00/00/00
          bar_border_width = ${toString config.variables.bar.borderWidth}
          bar_border[1] = rgb:00/00/00
          bar_color_selected[1] = rgb:00/00/00
          bar_color[1] = rgb:00/00/00
          bar_enabled = 1
          bar_font = Hack NF FC Ligatured CCG:pixelsize=${toString config.variables.bar.fontSize}:antialias=true
          bar_font_color_selected[1] = rgb:89/dd/ff
          bar_font_color[1] = rgb:84/84/84, rgb:cc/cc/cc, rgb:89/dd/ff, rgb:ff/cc/00, rgb:f0/71/78
          bar_format = +A
          bar_justify = center
          border_width = ${toString config.variables.borderWidth}
          color_focus = rgb:89/dd/ff
          color_focus_maximized = rgb:00/00/00
          color_unfocus = rgb:00/00/00
          color_unfocus_maximized = rgb:00/00/00
          focus_mode = manual
          modkey = Mod4
          region_padding = 0
          tile_gap = 0
          # programs
          program[menu] = j4-dmenu-desktop --dmenu="dmenu -b -i"
          program[term] = alacritty
          program[audio_down] = pamixer --decrease 10
          program[audio_mute] = pamixer --toggle-mute
          program[audio_up] = pamixer --increase 10
          program[brightness_down] = xbacklight -dec 10
          program[brightness_up] = xbacklight -inc 10
          # key bindings
          bind[] = MOD+p # disable menu
          bind[] = MOD+Shift+Delete # disable lock
          bind[] = MOD+Shift+Return # disable term
          bind[audio_down] = XF86AudioLowerVolume
          bind[audio_mute] = XF86AudioMute
          bind[audio_up] = XF86AudioRaiseVolume
          bind[brightness_down] = XF86MonBrightnessDown
          bind[brightness_up] = XF86MonBrightnessUp
          bind[cycle_layout] = MOD+Shift+space
          bind[menu] = MOD+space
          bind[term] = MOD+Return
          quirk[battle.net.exe] = FLOAT
          quirk[explorer.exe] = FLOAT
          quirk[winecfg.exe] = FLOAT
          quirk[winedevice.exe] = FLOAT
          quirk[wow.exe] = FLOAT
          ${config.variables.spectrwm}
        '';
      };
    };
    enable = true;
    mime.enable = true;
    userDirs.enable = true;
  };
}
