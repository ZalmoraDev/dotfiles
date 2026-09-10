#!/bin/bash
pkill -INT arecord

# awk is to remove punctuation for sentences of 4 words or less
whisper-cli -m ~/.local/share/whisper/ggml-medium.en-q8_0.bin \
    -f /tmp/stt_recording.wav 2>/dev/null \
    | grep -oP '(?<=\]   ).*' \
    | awk '{if(NF<=4) gsub(/[.!?,;]$/,""); printf "%s", $0}' \
    | wl-copy

# Paste through clipboard opposed to direct input, to negate accidental shortcut presses
wtype -M ctrl v -M ctrl -m ctrl
