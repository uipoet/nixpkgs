{ config, pkgs, ... }:

{
  security = {
    pam.services.gdm.enableGnomeKeyring = true;
    pki.certificateFiles = [
      "${pkgs.cacert}/etc/ssl/certs/ca-bundle.crt"
    ];
    rtkit.enable = true;
    sudo = {
      enable = true;
      extraRules = [{
        commands = [{
          command = "ALL";
          options = [ "NOPASSWD" ];
        }];
        groups = [ "wheel" ];
      }];
    };
  };
}
