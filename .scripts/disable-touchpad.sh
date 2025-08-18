
#!/usr/bin/env bash

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
    echo "enabled" > "$STATUS_FILE"
    hyprctl keyword '$TOUCHPAD_ENABLED' "true" -r
}

disable_touchpad() {
    echo "disabled" > "$STATUS_FILE"
    hyprctl keyword '$TOUCHPAD_ENABLED' "false" -r
}

if ! [ -f "$STATUS_FILE" ]; then
    disable_touchpad
else
    if [ $(cat "$STATUS_FILE") = "enabled" ]; then
        disable_touchpad
        elif [ $(cat "$STATUS_FILE") = "disabled" ]; then
        enable_touchpad
    fi
fi

