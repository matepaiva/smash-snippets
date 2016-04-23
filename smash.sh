#!/bin/bash
cd ~/my-smash-snippets
OLDCLIPBOARD=$(xsel -b)
xdotool key --clearmodifiers ctrl+shift+Left
xdotool key --clearmodifiers ctrl+Insert
xdotool key --clearmodifiers
sleep 0.2s # to work reliably in Firefox
SELECTION=$(xsel -b)
CAMINHO=$(find -name ${SELECTION})
if [ ${CAMINHO} ]; then
    xsel -b -i < ${CAMINHO}
    xdotool key --clearmodifiers shift+Insert
    xdotool --clearmodifiers
else
    gdialog --title "Smash" --yesno "Record clipboard content on keyword <b>\"${SELECTION}\"</b>?" 
    if [ $? == 0 ]; then
        echo -n "${OLDCLIPBOARD}" > "./${SELECTION}"
    fi
    xsel -b -i < ${SELECTION}
    xdotool key --clearmodifiers shift+Insert
    xdotool --clearmodifiers
fi
echo -n "${OLDCLIPBOARD}" | xclip -selection c
