{ config, pkgs, ... }:

{
  environment = {
    shellAliases = {
      c = "code";
      d = "docker";
      dc = "docker-compose";
      g = "git";
      ls = "ls -a --color=auto";
      n = "npm";
      nr = "npm run";
      p = "eval $(op signin my)";
      v = "nvim";
      vim = "nvim";
    };
    variables = {
      EDITOR = "nvim";
      HWMON_PATH = "$(echo /sys/devices/platform/coretemp.0/hwmon/hwmon*)";
      PATH = "/home/jamie/.npm/node_modules/bin:/home/jamie/bin:$PATH";
      WINEARCH = "win64";
    };
  };
}
