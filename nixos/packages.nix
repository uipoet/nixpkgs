{ config, pkgs, ... }:
let unstable = import <unstable> { };
in
{
  environment.systemPackages = (with pkgs; [
    _1password
    acpilight
    aiki-gtk-theme
    awscli2
    bc # cli calculator
    cacert
    canon-cups-ufr2
    curl
    docker-compose # docker manager
    git
    go
    gnumake
    hsetroot
    inotify-tools # monitor file events
    jq # JSON cli
    lm_sensors # thermal cli
    mkcert
    neovim # cli editor
    nix-prefetch-github # display fetchWithGitHub data
    nixpkgs-fmt # format nix files
    openssl
    pamixer # sound cli manager
    pciutils
    starship # cli prompt
    synergyWithoutGUI # share one mouse and keyboard between multiple computers
    wget
    wine
    winetricks
  ]) ++ (with pkgs.gitAndTools; [
    gh # cli for GitHub
    gitui # terminal ui for git
  ]) ++ (with unstable; [
    k9s # Kubernetes cli dashboard
    kind # Kubernetes in Docker
    kubectl # Kubernetes cli
    kubernetes-helm # Kubernetes package manager
    manix # nix documentation searcher
    nodejs
    signal-cli
    yarn
  ]);
}
