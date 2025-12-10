TARGET_MONITOR="eDP-1"
TARGET_WORKSPACE="special:magic"

# Focus to the laptop monitor
hyprctl dispatch focusmonitor "$TARGET_MONITOR"

# Enable 
hyprctl dispatch togglespecialworkspace, magic

