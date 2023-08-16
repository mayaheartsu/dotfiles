#!/bin/sh

#packages
yay -S afetch blueman base base-devel blueman bluez-tools brillo btop catppuccin-gtk-theme-mocha dunst file-roller firefox geeqie git gparted grim guvcview hyprland-git kitty libnotify light lightly-qt man-db mpv nano nemo nemo-fileroller neofetch nwg-look-bin obs-studio pamixer pavucontrol polkit polkit-kde-agent python-requests qogir-icon-theme qt5ct ranger rate-mirrors-bin rofi rofi-emoji sddm-catppuccin-git sddm-config-editor-git sddm-git slurp swappy swaybg swayidle swaylock-effects-git timeshift-bin tldr ttf-font-awesome vscodium-bin waybar webcord-bin wf-recorder wlr-randr xdg-desktop-portal-hyprland xdg-user-dirs xed

#nvidia specific packages
#nvidia-dkms or nvidia-open-dkms nvidia-settings nvidia-utils

#game related packages
#lutris steam gamescope goverlay mangohud protonup-qt prismlauncher-bin

#-10 dB on mic

#https://github.com/yokoffing/Betterfox

#rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist

#/etc/environment
#QT_QPA_PLATFORMTHEME=qt5ct MANGOHUD=1

#intel-gpu-tools intel-media-driver libva-utils xf86-video-intel auto-cpufreq-git blueman bluez-tools pamixer pavucontrol hyprland waybar-hyprland rofi rofi-emoji dunst kitty swaybg swaylock-fancy-git swayidle light brillo btop file-roller pcmanfm ranger lightly-qt catppuccin-gtk-theme-mocha nwg-look-bin qt5ct polkit polkit-kde-agent rate-mirrors sddm-git sddm-catppuccin-git vscodium-bin webcord xdg-desktop-portal-hyprland xdg-user-dirs noto-fonts noto-fonts-cjk noto-fonts-emoji ttf-font-awesome python-requests qogir-icon-theme libnotify grim slurp timeshift-bin gparted xed

#systemctl enable sddm.service

#https://github.com/1amSimp1e/dots/tree/late-night-%F0%9F%8C%83
#https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.ziphttps://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip
#https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip
#https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
#https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf

#fc-cache -fv
