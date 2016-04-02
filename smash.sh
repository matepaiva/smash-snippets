#!/bin/bash
cd ~/my-smash-snippets
OLDCLIPBOARD=$(xsel -b)
xdotool key --delay 0 ctrl+shift+Left
xdotool key --delay 150 ctrl+x
sleep 0.2s # to work reliably in Firefox
SELECTION=$(xsel -b)
CAMINHO=$(find -name ${SELECTION})
if [ ${CAMINHO} ]; then
    xsel -b -i < ${CAMINHO}
    xdotool key --delay 150 shift+Insert
else
    gdialog --title "Smash" --yesno "Record clipboard content on keyword <b>\"${SELECTION}\"</b>?" 
    if [ $? == 0 ]; then
        echo -n "${OLDCLIPBOARD}" > "./${SELECTION}"
    fi
    xsel -b -i < ${SELECTION}
    xdotool key --delay 150 shift+Insert
fi
echo -n "${OLDCLIPBOARD}" | xclip -selection c