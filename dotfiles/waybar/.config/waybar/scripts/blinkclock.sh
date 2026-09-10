#!/bin/bash

TIME=$(date "+%a %-d %H:%M")
MIN=$(date "+%M")

# Use class names instead of color
if [[ "$MIN" == "00" || "$MIN" == "30" ]]; then
    CLASS="clock-orange"
else
    CLASS="clock-white"
fi

# Output JSON
echo "{\"text\": \"$TIME\", \"class\": \"$CLASS\"}"

