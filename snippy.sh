#!/bin/bash
OLDCLIPBOARD=$(xsel -b)
xdotool key --delay 0 ctrl+shift+Left
xdotool key ctrl+x
sleep 0.2s # to work reliably in Firefox
SELECTION=$(xsel -b)
xsel -b -i < ~/my-snippets/${SELECTION}
xdotool key --delay 200 shift+Insert
# xdotool key BackSpace    delete the last blank line, so we stay inline
echo -n "${OLDCLIPBOARD}" | xclip -selection c
