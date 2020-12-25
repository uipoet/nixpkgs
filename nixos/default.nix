{ config, pkgs, ... }:

{
  i18n.defaultLocale = "en_US.UTF-8";

  imports = [
    ../modules/nixpkgs.nix
    ./boot.nix
    ./console.nix
    ./environment.nix
    ./fonts.nix
    ./networking.nix
    ./nix.nix
    ./packages.nix
    ./programs.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./users.nix
    ./virtualisation.nix
    ./xdg.nix
  ];

  system.stateVersion = "20.09";

  time.timeZone = "America/Los_Angeles";
}
