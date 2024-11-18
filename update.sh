#!/bin/bash

date

# Update and upgrade packages with single command sequence
pacman -Syu --noconfirm \
        && paccache -r -k 1 \
        && flatpak upgrade -y \
        && grub-install \
        && grub-mkconfig -o /boot/grub/grub.cfg 

# Grab "linux" from the OS
k_name=$(uname -s | tr '[:upper:]' '[:lower:]')

## Extract the -lts or -rt if that's the current kernel
k_ver=$(uname -r | rev | cut -d '-' -f 1 | rev)
if ! [[ $k_ver =~ ^[0-9]+$ ]]; then k_name="$k_name-$k_ver"; fi

echo "kexec into: $k_name" \
        && date \
        && sleep 5

systemctl start kexec-load@$k_name.service \
        && systemctl start kexec.target