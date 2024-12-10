#!/bin/bash
date
# Update and upgrade packages with single command sequence
output=$(pacman -Syu --noconfirm \
        && paccache -r -k 1 \
        && flatpak upgrade -y)

echo "$output"

k_name=$(uname -s \
        | tr '[:upper:]' '[:lower:]')
        
k_ver=$(uname -r \
        | rev \
        | cut -d '-' -f 1 \
        | rev)
        
if ! [[ $k_ver =~ ^[0-9]+$ ]]; then k_name="$k_name-$k_ver"; fi

if [[ $output =~ $k_name ]]; then
        echo "Reboot" \
                && date \
                && sleep 5 \
                && shutdown -r now
else
        echo "kexec into: $k_name" \
                && date \
                && sleep 5 \
                && systemctl start kexec-load@$k_name.service \
                && systemctl start kexec.target
fi
