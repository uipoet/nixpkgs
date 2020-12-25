{ config, pkgs, ... }:
let unstable = import <unstable> { };
in
{
  users.users.jamie = {
    description = "Jamie Hoover <jamie@aiki.app>";
    extraGroups = [ "audio" "dialout" "docker" "networkmanager" "video" "wheel" ];
    isNormalUser = true;
    shell = pkgs.zsh;
  };
}
