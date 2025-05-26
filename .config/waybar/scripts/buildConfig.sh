#!/bin/bash
set -e

# Check for jq
if ! command -v jq &> /dev/null; then
  echo "Error: jq is not installed."
  exit 1
fi

# Set Variables
CONFIG_DIR="$HOME/dots/.config/waybar"
BASE_FILE="$CONFIG_DIR/base.json"
MODULE_DIR="$CONFIG_DIR/modules"
OUTPUT_FILE="$CONFIG_DIR/config"

# Sanity checks
if [[ ! -f "$BASE_FILE" ]]; then
  echo "Error: Base config file not found at $BASE_FILE"
  exit 1
fi

if [[ ! -d "$MODULE_DIR" ]]; then
  echo "Error: Modules directory not found at $MODULE_DIR"
  exit 1
fi

# Start from the base file
echo "Loading base config from $BASE_FILE"
config=$(cat "$BASE_FILE")

# Loop through module files and merge them
for MODULE_FILE in "$MODULE_DIR"/*.json; do
  MODULE_NAME=$(jq -r 'keys[0]' "$MODULE_FILE")
  echo "Merging module: $MODULE_NAME"

  # Extract module object
  MODULE_CONTENT=$(jq '.' "$MODULE_FILE")

  # Merge module into top level of config
  config=$(jq -s '.[0] + .[1]' <(echo "$config") <(echo "$MODULE_CONTENT"))
done

# Write final combined config
echo "$config" > "$OUTPUT_FILE"
echo "Combined Waybar config written to $OUTPUT_FILE"

# Restart Waybar
pkill waybar && hyprctl dispatch exec waybar
echo "Restarted Waybar"
