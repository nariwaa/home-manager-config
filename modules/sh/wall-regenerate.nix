{
  home.file."/home/ayaya/.config/sh/wall-regenerate.sh" = {
    text = ''

count=0

swww kill

for img in /sync/wall/Dark/*; do
    wal -i "$img"
    count=$((count + 1))
    echo "$count images done!"
done

for img in /sync/wall/Light/*; do
    wal -i "$img"
    count=$((count + 1))
    echo "$count images done!"
done

setsid swww init

exit

    '';
    executable = true;
  };
}
