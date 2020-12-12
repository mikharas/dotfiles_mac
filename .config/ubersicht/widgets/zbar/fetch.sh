#!/bin/sh

PATH=/usr/local/bin/:$PATH

# Check if yabai exists
if ! [ -x "$(command -v yabai)" ]; then
  echo "{\"error\":\"yabai binary not found\"}"
  exit 1
fi

SPACES=$(yabai -m query --spaces)
WINDOWS=$(yabai -m query --windows)
DISPLAYS=$(yabai -m query --displays)

echo $(cat <<-EOF
{
  "spaces": $SPACES,
  "windows": $WINDOWS,
  "displays": $DISPLAYS
}
EOF
)
