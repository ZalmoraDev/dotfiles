#!/bin/bash

USED=$(nvidia-smi --query-gpu=memory.used,memory.total --format=csv,noheader,nounits \
| awk -F',' '{printf "%.1f/%.0f\n", $1/1024, $2/1024}')

echo "$USED"
