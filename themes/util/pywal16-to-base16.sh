#!/bin/sh

# Converts a pywal-style JSON to Base16 JSON format.
# Usage: ./pywal-to-base16.sh wal-colors.json > base16.json

input="$1"

if [ ! -f "$input" ]; then
  echo "Usage: $0 path/to/wal.json" >&2
  exit 1
fi

jq -r '
{
  scheme: "pywal-converted",
  author: "converted from pywal",
  base00: .colors.color0,
  base01: .colors.color8,
  base02: .colors.color1,
  base03: .colors.color2,
  base04: .colors.color4,
  base05: .special.foreground,
  base06: .colors.color7,
  base07: .colors.color15,
  base08: .colors.color1,
  base09: .colors.color9,
  base0A: .colors.color11,
  base0B: .colors.color2,
  base0C: .colors.color13,
  base0D: .colors.color4,
  base0E: .colors.color5,
  base0F: .colors.color14
}
' "$input"
