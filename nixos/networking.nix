{ config, pkgs, ... }:
let hostName = config.variables.hostName;
in
{
  networking = {
    extraHosts = ''
      127.0.0.1 ${hostName} ${hostName}.local dataroom.nrs.local loansfn.local
      10.0.0.1 amplifi.local
      10.0.0.2 pi.local
      10.0.0.3 aiki.local
      10.0.0.4 p53.local
      10.0.0.8 x1.local
    '';
    firewall.enable = false;
    hostName = hostName;
    interfaces = {
      enp0s31f6.useDHCP = true;
      wlp82s0.useDHCP = true;
    };
    networkmanager = {
      dns = "none";
      enable = true;
      insertNameservers = [ "1.1.1.2" "1.0.0.2" ];
    };
  };
}
