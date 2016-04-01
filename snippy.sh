#!/bin/bash
OLDCLIPBOARD=$(xsel -b)
xdotool key --delay 0 ctrl+shift+Left
xdotool key ctrl+x
sleep 0.2s # to work reliably in Firefox
SELECTION=$(xsel -b)
CAMINHO=$(find -name ${SELECTION})
xsel -b -i < ${CAMINHO}
xdotool key --delay 50 shift+Insert
echo -n "${OLDCLIPBOARD}" | xclip -selection c
