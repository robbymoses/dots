
# Get the current submap
submap=$(hyprctl submap)

# Only print the submap name if it's active
if [ -n "$submap" ] && [ "$submap" != "default" ]; then
    echo "Active Submap: $submap"
fi
