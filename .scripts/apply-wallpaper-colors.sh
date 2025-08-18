#! /bin/bash

mapfile -t colors < <(magick ~/.config/waypaper/current_wallpaper -resize 400x400\! +dither -colors 8 -format %c histogram:info:- | awk '{print $3}')

quickshell=$(eval echo "~/.config/quickshell")
hypr=$(eval echo "~/.config/hypr")
kitty=$(eval echo "~/.config/kitty")
names=(
  "background"
  "primary"
  "secondary"
  "highlight"
  "accent"
  "warning"
  "muted"
  "foreground"
)

# create a function to do the quickshell color generation
generate_quickshell_colors() {
  {
    echo "var colors = {"
    echo "  pitchBlack: \"#000000\","
    for i in "${!colors[@]}"; do
    echo -n "  ${names[$i]}: \"${colors[$i]}\""
    [ $i -lt $((${#colors[@]} - 1)) ] && echo "," || echo
  done
  echo "}"
} > "$quickshell/Theme/Colors.js"

shell=$(cat "$quickshell/Theme/Theme.qml")
echo "$shell" > "$quickshell/Theme/Theme.qml"
}

generate_kitty_colors() {
  {
    for i in "${!colors[@]}"; do
        echo -n "${names[$i]} ${colors[$i]}"
        [ $i -lt $((${#colors[@]} - 1)) ] && echo "" || echo
    done
  } > "$kitty/themes/auto.conf"

  kitten themes --reload-in=all auto
}

generate_hypr_colors() {
  {
    for i in "${!colors[@]}"; do
        hex=${colors[$i]#\#}
        echo -n "\$${names[$i]}=0xff$hex"
    [ $i -lt $((${#colors[@]} - 1)) ] && echo "" || echo
done
} > "$hypr/colors.conf"
}

# Generate all color configurations
generate_quickshell_colors
generate_kitty_colors
generate_hypr_colors