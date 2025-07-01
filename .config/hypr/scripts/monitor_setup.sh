#!/bin/bash

# Function to get monitor info by serial
get_monitor_by_serial() {
    local SERIAL="$1"
    # This will return the entire object for the monitor with matching serial
    hyprctl monitors -j | jq -r ".[] | select(.serial == \"$SERIAL\")"
}

get_monitor_by_model(){
    local MODEL="$1"
    # This will return the entire object for the monitor with matching model
    hyprctl monitors -j | jq -r ".[] | select(.model == \"$MODEL\")"    
}

set_monitor_workspace(){
    local MONITOR="$1"
    local WORKSPACE="$2"
    hyprctl keyword workspace "$MONITOR,$WORKSPACE"
}


# Monitor Variables
HOME_PRIMARY=$(get_monitor_by_serial "H1AK500000")
WORK_PRIMARY=$(get_monitor_by_serial "????")
WORK_SECONDARY=$(get_monitor_by_serial "????")
WORK_LAPTOP=$(get_monitor_by_model "0x09E9")
DUO_LAPTOP=$(get_monitor_by_model "0x419D")
LAPTOP_SCALE=1
ENABLE_DUO=false

if [ ! -z "$WORK_LAPTOP" ]; then
    LAPTOP_SCALE=1.25
fi

if [ ! -z "$DUO_LAPTOP" ]; then
    LAPTOP_SCALE=1.5
fi

# Check if enable_duo flag is passed
if [ "$1" = "--enable_duo" ]; then
    echo "Enabling Duo!"
    ENABLE_DUO=true
    echo $ENABLE_DUO
fi

# Home Office Setup
if [ ! -z "$HOME_PRIMARY" ]; then
    # Extract specific fields
    MONITOR_NAME=$(echo "$MONITOR_DATA" | jq -r '.name')
    MONITOR_DESC=$(echo "$MONITOR_DATA" | jq -r '.description')

    hyprctl keyword monitor $MONITOR_NAME, highres, 0x0, 1
    hyprctl keyword monitor eDP-1, highres, auto-down, $LAPTOP_SCALE
    hyprctl keyword monitor eDP-2, disable
    set_monitor_workspace $MONITOR_NAME 1
    set_monitor_workspace $MONITOR_NAME 2
    set_monitor_workspace $MONITOR_NAME 3
    set_monitor_workspace eDP-1 4
    set_monitor_workspace eDP-1 5
    set_monitor_workspace eDP-1 6
fi

# Work Setup
if [ ! -z "$WORK_PRIMARY" ]; then
    echo "Work Primary"
    # Extract specific fields
    MONITOR_NAME=$(echo "$MONITOR_DATA" | jq -r '.name')
    MONITOR_DESC=$(echo "$MONITOR_DATA" | jq -r '.description')
fi

# Laptop Setup
if [ -z "$HOME_PRIMARY" ] && [ -z "$WORK_PRIMARY" ]; then
    echo "No Primaries"
    if [ ! -z "$DUO_LAPTOP" ]; then
	echo "Duo Laptop"
        MONITOR_NAME=$(echo "$DUO_LAPTOP" | jq -r '.name')
        
        if [ "$ENABLE_DUO" = true ]; then
	    echo "enable duo!"
            # Configure both screens for Duo laptop
            hyprctl keyword monitor eDP-1, highres, 0x0, $LAPTOP_SCALE
            hyprctl keyword monitor eDP-2, highres, auto-down, $LAPTOP_SCALE
            
            # Set workspaces for top screen
            set_monitor_workspace eDP-1 1
            set_monitor_workspace eDP-1 2
            set_monitor_workspace eDP-1 3
            
            # Set workspaces for bottom screen
            set_monitor_workspace eDP-2 4
            set_monitor_workspace eDP-2 5
            set_monitor_workspace eDP-2 6
        else
            # Disable bottom screen, use only top screen
            hyprctl keyword monitor eDP-1, highres, 0x0, $LAPTOP_SCALE
            hyprctl keyword monitor eDP-2, disable
            
            # All workspaces on top screen
            for i in {1..6}; do
                set_monitor_workspace $MONITOR_NAME $i
            done
        fi
    elif [ ! -z "$WORK_LAPTOP" ]; then
        # Regular laptop setup
        MONITOR_NAME=$(echo "$WORK_LAPTOP" | jq -r '.name')
        hyprctl keyword monitor $MONITOR_NAME, highres, 0x0, $LAPTOP_SCALE
        
        # Set all workspaces on the laptop screen
        for i in {1..6}; do
            set_monitor_workspace $MONITOR_NAME $i
        done
    fi
fi

# Notify user of completion
notify-send "Monitor Setup" "Monitor configuration applied successfully" 
