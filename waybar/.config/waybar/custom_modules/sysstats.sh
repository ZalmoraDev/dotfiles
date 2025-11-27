#!/bin/bash

# CPU usage (%)
CPU=$(top -bn1 | awk '/Cpu/ {print 100 - $8}')

# GPU usage (NVIDIA)
GPU=$(nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits 2>/dev/null)
[ -z "$GPU" ] && GPU="0"    # fallback if no NVIDIA GPU

# Memory (GB)
read USED TOTAL <<< $(free -m | awk '/Mem:/ {printf "%.1f %.1f", $3/1024, $2/1024}')

TEXT=" ${CPU%.*}%  󰍹 ${GPU}%   ${USED}G/${TOTAL}G"

printf '{"text":"%s"}\n' "$TEXT"
