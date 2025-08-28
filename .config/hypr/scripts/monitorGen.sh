#!/run/current-system/sw/bin/bash

# Function to list active Hyprland monitors
get_active_monitors() {
    hyprctl monitors | grep 'Monitor' | awk '{print $2}' | wc -l
}

if [ "$(hostname)" = "operari" ]; then
    echo "Monitor count: $(get_active_monitors)"
elif [ "$(hostname)" = "versalis" ]; then
    echo personal
fi