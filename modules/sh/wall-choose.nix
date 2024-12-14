{
  home.file."~/.config/sh/wall-choose" = {
    text = ''
# Function to display wallpapers with preview
display_wallpapers() {
    local mode=$1
    local dir="/sync/wall/$mode"
    local selected=$(find "$dir" -type f \( -iname "*.gif" -o -iname "*.png" \) | \
    while read -r img; do
        echo -en "$img\x00icon\x1f$(echo "$img" | sed 's/ /%20/g')\n"
    done | rofi -dmenu -i -p "Select $mode wallpaper" -width 1000 -lines 10 -eh 1 -matching fuzzy)

    if [[ -n "$selected" ]]; then
        wall "$selected" 
    fi
}

# Main menu to select dark or light mode
tdark="   Dark  "
tlight="󰖨   Light  󰖨"
mode=$(echo -e "$tdark\n$tlight" | rofi -dmenu -i -p "Select Mode" -width 300 -lines 2 -eh 1 -matching fuzzy)

case $mode in
    $tdark)
        display_wallpapers "Dark"
        ;;
    $tlight)
        display_wallpapers "Light"
        ;;
    *)
        echo "Invalid selection"
        exit 1
        ;;
esac
    '';
    executable = true;
  };
}
