{ config, pkgs, ... }:

{
  home = {
    file = {
      ".aws/config".text = ''
        [profile work]
        credential_process = sh -c "op get item aws --fields aws_access_key_id,aws_secret_access_key --vault Work | jq '. | {Version:1, AccessKeyId:.aws_access_key_id, SecretAccessKey:.aws_secret_access_key}'"
        output = json
        region = us-west-1
      '';
    };
    homeDirectory = "/home/jamie";
    stateVersion = "21.03";
    username = "jamie";
  };

  imports = [
    ../modules/nixpkgs.nix
    ./gtk.nix
    ./packages.nix
    ./programs.nix
    ./xdg.nix
    ./xresources.nix
  ];

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  news.display = "silent";
}
