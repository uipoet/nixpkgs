{ config, pkgs, ... }:

{
  gtk = {
    enable = true;
    font.name = "Hack FC Ligatured CCG 10";
    gtk2 = {
      extraConfig = ''
        gtk-button-images=0
        gtk-enable-event-sounds=1
        gtk-enable-input-feedback-sounds=1
        gtk-menu-images=0
        gtk-modules="gail:atk-bridge"
        gtk-toolbar-icon-size=GTK_ICON_SIZE_LARGE_TOOLBAR
        gtk-toolbar-style=GTK_TOOLBAR_BOTH
        gtk-xft-antialias=1
        gtk-xft-hinting=1
        gtk-xft-hintstyle="hintslight"
        gtk-xft-rgba="rgb"
      '';
    };
    gtk3 = {
      bookmarks = [ ];
      extraCss = ''
        * {
          text-shadow: none;
        }

        window decoration {
          border: none;
          margin: 0;
          padding: 0;
        }
      '';
      extraConfig = {
        gtk-application-prefer-dark-theme = 1;
        gtk-button-images = 0;
        gtk-decoration-layout = "icon:minimize,maximize,close";
        gtk-enable-animations = 1;
        gtk-enable-event-sounds = 1;
        gtk-enable-input-feedback-sounds = 1;
        gtk-menu-images = 0;
        gtk-primary-button-warps-slider = 1;
        gtk-toolbar-icon-size = "GTK_ICON_SIZE_LARGE_TOOLBAR";
        gtk-toolbar-style = "GTK_TOOLBAR_BOTH";
        gtk-xft-antialias = 1;
        gtk-xft-hinting = 1;
        gtk-xft-hintstyle = "hintslight";
        gtk-xft-rgba = "rgb";
      };
    };
    iconTheme.name = "Aiki";
    theme.name = "Aiki";
  };
}
