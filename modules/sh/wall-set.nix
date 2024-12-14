{
  home.file."/home/ayaya/.config/sh/wall-set.sh" = {
    text = ''

cp $1 /tmp/current.png
wal -i $1
killall .waybar-wrapped
setsid swww img $1 --resize crop -t random --transition-duration 3 --transition-fps 100 & disown
sleep 3.5
setsid waybar & disown
exit

    '';
    executable = true;
  };
}
