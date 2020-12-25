{ config, pkgs, ... }:

{
  programs = {
    dconf.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    mosh.enable = true;
    ssh.extraConfig = ''
      Host gitlab.com
        UpdateHostKeys no
    '';
    zsh = {
      autosuggestions.enable = true;
      enable = true;
      enableCompletion = true;
      enableGlobalCompInit = true;
      interactiveShellInit = ''
        clearTerminal() { command clear; zle redisplay }
        zle -N clearTerminal
        bindkey '^L' clearTerminal
      '';
      loginShellInit = ''
      '';
      promptInit = ''
        eval "$(starship init zsh)"
      '';
      setOptions = [
        "HIST_IGNORE_DUPS"
        "SHARE_HISTORY"
        "HIST_FCNTL_LOCK"
      ];
      shellInit = ''
        . "$HOME/.nix-profile/etc/profile.d/hm-session-vars.sh"
      '';
      syntaxHighlighting.enable = true;
      vteIntegration = true;
    };
  };
}
