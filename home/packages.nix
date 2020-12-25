{ config, pkgs, ... }:
let
  spectrwm-baraction = pkgs.writeShellScriptBin "spectrwm-baraction" ''
    PATH=/run/current-system/sw/bin

    icon() {
      echo -n "+@fg=1;$1+@fg=0;"
    }

    iconWarn() {
      echo -n "+@fg=3;$1+@fg=0;"
    }

    iconDanger() {
      echo -n "+@fg=4;$1+@fg=0;"
    }

    sleep_sec=1
    i=0
    while :
      do
        # Date
        dte="$(date +"$(icon ) %a %D  $(icon ) %I:%M %p")"

        echo -n "$dte  "

        # Battery
        if (( $i % 60 == 0 )); then
          charged=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 |
            grep percentage |
            sed 's/ *percentage: *//g'`

          state=`upower -i /org/freedesktop/UPower/devices/battery_BAT0 |
            grep state |
            sed 's/ *state: *//'`
        fi

        if [ $state == "fully-charged" ]
        then
          echo -n "$(icon )"
        elif [ $state == "charging" ]
        then
          echo -n "$(icon )"
        else
          current=`echo $charged | sed 's/%//'`

          if [ $current -le 10 ]; then
            echo -n "$(iconDanger )"
          elif [ $current -le 20 ]; then
            echo -n "$(iconWarn )"
          elif [ $current -le 30 ]; then
            echo -n "$(iconWarn )"
          elif [ $current -le 40 ]; then
            echo -n "$(icon )"
          elif [ $current -le 50 ]; then
            echo -n "$(icon )"
          elif [ $current -le 60 ]; then
            echo -n "$(icon )"
          elif [ $current -le 70 ]; then
            echo -n "$(icon )"
          elif [ $current -le 80 ]; then
            echo -n "$(icon )"
          elif [ $current -le 90 ]; then
            echo -n "$(icon )"
          else
            echo -n "$(icon )"
          fi
        fi

        echo -n " $charged  "

        # Network

        if [ $(cat /sys/class/net/enp0s31f6/operstate) == "up" ]; then
          echo -n "$(icon  )  "
        fi

        if [ $(cat /sys/class/net/wlp82s0/operstate) == "up" ]; then
          echo -n "$(icon 直)  "
        else
          echo -n "睊  "
        fi

        # Volume
        muted=`pamixer --get-mute`
        volume=`pamixer --get-volume`

        if [[ $muted == "true" ]]; then
          echo -n "$(icon 婢)  "
        else
          if [ $volume -le 25 ]; then
            echo -n "$(icon )"
          elif [ $volume -le 50 ]; then
            echo -n "$(icon 奔)"
          elif [ $volume -le 75 ]; then
            echo -n "$(icon 墳)"
          else
            echo -n "$(icon )"
          fi

          echo -n " $volume%  "
        fi

        # CPU
        cpu=`echo "scale=0; ($(cat /proc/loadavg | awk '{print $1}') + 0.5) / 1" | bc -l`

        echo -n "$(icon 龍) $cpu%  "

        # GPU
        gpu=`nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits`
        echo -n "$(icon ) $gpu%  "

        # Memory
        memory=`echo "scale=0; ($(free -m | awk 'NR==2{printf "%.2f", $3*100/$2}') + 0.5) / 1" | bc -l`

        echo -n "$(icon ﬙) $memory%  "

        # Disk
        disk=`df -h | awk '$NF=="/"{printf "%s", $5}'`

        echo -n "$(icon ) $disk  "

        # Temperature

        temperature=$(echo "scale=0; $(cat $HWMON_PATH/temp1_input) / 1000" | bc -l)

        if [ $temperature -le 25 ]; then
          echo -n "$(icon )"
        elif [ $temperature -le 50 ]; then
          echo -n "$(icon )"
        elif [ $temperature -le 75 ]; then
          echo -n "$(iconWarn )"
        else
          echo -n "$(iconDanger )"
        fi

        echo -e " $temperature°C  "

        sleep $sleep_sec
        (( i += $sleep_sec ))
      done
  '';
  unstable = import <unstable> { };
in
{
  home.packages = [
    spectrwm-baraction
  ] ++ (with pkgs; [
    discord
    dmenu
    insomnia
    j4-dmenu-desktop
    pavucontrol
    signal-desktop
    spectacle
    spotify
    webtorrent_desktop # torrent gui
    xclip # clipboard
    xournalpp # notetaking and pdf annotation
  ]) ++ (with pkgs.gnome3; [
    dconf-editor
    eog # image viewer
    evince # pdf reader
    glib # contains gio for trash
    gnome-calculator
    gnome-disk-utility
    gnome-font-viewer
    gnome-keyring
    nautilus # file manager
    seahorse # keyring gui manager
    simple-scan
    zenity # display dialogs
  ]) ++ (with unstable; [
    brave
    chrysalis
    vscode
  ]);
}
