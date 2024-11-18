#!/bin/bash

echo "Attempt at a oneshot installation and setup of update script from git.com/gloatoriginal/arch_update"
echo "Lets get sudo out of the way with a quick download of cronie, kexec and flatpak"
sudo pacman -S cronie kexec-tools flatpak \
        && sudo systemctl enable --now cronie

chmod +x ./update.sh \
        && sudo cp ./unmodeset.service /etc/systemd/system/ \
        && sudo systemctl enable unmodeset.service \
        && sudo cp ./kexec-load@.service /etc/systemd/system/ 

echo "cronjobs have not been set and require YOU the user to set them up, but cronie is enable in your systemctl."
 
v
