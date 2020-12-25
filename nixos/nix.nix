{ config, pkgs, ... }:

{
  nix = {
    # Automate `nix-store --optimise`
    autoOptimiseStore = true;

    # Avoid unwanted garbage collection when using nix-direnv
    extraOptions = ''
      keep-outputs = true
      keep-derivations = true
    '';

    # Automate garbage collection
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 7d";
    };

    optimise.automatic = true;

    # Required by Cachix to be used as non-root user
    trustedUsers = [ "jamie" "root" ];
  };
}
