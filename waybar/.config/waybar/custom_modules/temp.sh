#!/bin/bash
temp=$(cat /sys/class/hwmon/hwmon2/temp1_input)
temp=$((temp / 1000))

if [ $temp -lt 40 ]; then
    class="cool"
elif [ $temp -lt 60 ]; then
    class="normal"
elif [ $temp -lt 80 ]; then
    class="warm"
else
    class="critical"
fi

echo "{\"text\":\"${temp}°C\",\"class\":\"$class\"}"
