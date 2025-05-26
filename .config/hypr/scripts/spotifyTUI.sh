if ! hyprctl clients | grep -q "spotify_player"; then
    # Laucnh the player with custom class and title to be identified by windowrules
    kitty --class "spotify_tui_player" -e spotify_player
fi