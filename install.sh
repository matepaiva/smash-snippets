#!/bin/bash
sudo -v

echo "Tornando arquivo executável."
chmod +x smash.sh

echo "Copiando para /usr/local/bin/"
sudo cp smash.sh /usr/local/bin/smash

echo "Criando tecla de atalho."
KEYBINDLIST=$(gsettings get org.gnome.settings-daemon.plugins.media-keys custom-keybindings)
KEYBINDLIST=${KEYBINDLIST:0:-1}
if [ "${KEYBINDLIST}" == "@as [" ]; then
    KEYBINDLIST=${KEYBINDLIST:3}
    KEYBINDLIST+="'/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/smash/']"
else
    KEYBINDLIST+=", '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/smash/']"
fi
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "${KEYBINDLIST}"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/smash/ name 'Smash'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/smash/ command 'smash'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/smash/ binding '<Control>comma'

echo "Criando pasta 'my-smash-snippets'."
mkdir ~/my-smash-snippets

echo "Instalação finalizada!"
sudo -k