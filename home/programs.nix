{ config, pkgs, ... }:
let
  unstable = import <unstable> { };
in
{
  programs = {
    alacritty = {
      enable = true;
      package = unstable.alacritty;
      settings = {
        bell = {
          animation = "EaseOutExpo";
          color = "0xffffff";
          duration = 10;
        };
        colors = {
          cursor = {
            cursor = "#ffcc00";
            text = "#192227";
          };
          normal = {
            black = "#000000";
            blue = "#82aaff";
            cyan = "#89ddff";
            green = "#c3e88d";
            magenta = "#c792ea";
            red = "#f07178";
            white = "#ffffff";
            yellow = "#ffcb6b";
          };
          primary = {
            background = "#1a1a1a";
            foreground = "#cccccc";
          };
        };
        font = {
          normal = {
            family = "Hack FC Ligatured CCG";
            style = "Regular";
          };
          size = 10;
          offset = {
            x = 0;
            y = 6;
          };
          glyph_offset = {
            x = 0;
            y = 6;
          };
        };
        window = {
          padding = {
            x = 20;
            y = 10;
          };
        };
      };
    };
    chromium = {
      enable = true;
      extensions = [
        "aeblfdkhhhdcdjpifhhbdiojplfjncoa" # 1Password X – Password Manager
        "eimadpbcbfnmbkopoojfekhnkhdbieeh" # Dark Reader
        "bkdgflcldnnnapblkhphbgpggdiikppg" # DuckDuckGo Privacy Essentials
        "kglhbbefdnlheedjiejgomgmfplipfeb" # Jitsi Meetings
        "bgfofngpplpmpijncjegfdgilpgamhdk" # Modern scrollbar
        "fmkadmapgofadopljbjfkapdkoienihi" # React Developer Tools
        "pgjjikdiikihdfpoppgaidccahalehjh" # Speedtest by Ookla
        "pedpfddehkfmobhbnccdcbhidojinimh" # Video Adblocker - Block Pre Roll Ad
      ];
      # package = unstable.chromium;
    };
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    git = {
      enable = true;
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
        rebase = {
          abbreviateCommands = true;
          autoSquash = true;
          autoStash = true;
          missingCommitsCheck = "warn";
        };
      };
      userEmail = "git@aiki.app";
      userName = "Jamie Hoover";
    };
    home-manager.enable = true;
    starship = {
      enable = true;
      settings = {
        add_newline = false;
        scan_timeout = 10;
      };
    };
  };
}
