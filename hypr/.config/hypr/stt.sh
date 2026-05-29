#!/bin/bash
tmp=$(mktemp /tmp/stt.wav)

# Record until script is killed or you set a fixed duration
arecord -f cd -t wav -d 5 $tmp 2>/dev/null

# Run whisper-cpp, grab only the transcribed text
~/.local/share/whisper.cpp/main \
    -m ~/.local/share/whisper.cpp/models/ggml-base.en.bin \
    -f $tmp \
    --no-timestamps \
    -nt 2>/dev/null | tail -n1 | wtype -

rm $tmp
