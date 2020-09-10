#!/bin/sh

check=`ps -ef | grep "yabai" | grep -v "grep" | wc -l | cut -d " " -f8`

if [ $check -ge 1 ]; then
  index=`/usr/local/bin/python3 /Users/mac/.config/ubersicht/widgets/lib/windows.py`
  echo "$index"
else
  echo ""
fi
