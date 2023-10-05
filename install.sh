#!/bin/sh

echo -ne "
-------------------------------------------------------------------------
                    mayadots installer 
-------------------------------------------------------------------------
"

echo -ne "
-------------------------------------------------------------------------
                    rate-mirrors installation & mirror sort
-------------------------------------------------------------------------
"
yay -S rate-mirrors-bin
sudo rate-mirrors --allow-root --protocol https arch | sudo tee /etc/pacman.d/mirrorlist

echo -ne "
-------------------------------------------------------------------------
                    cpu microcode
-------------------------------------------------------------------------
"
# determine processor type and install microcode
proc_type=$(lscpu)
if grep -E "GenuineIntel" <<< ${proc_type}; then
    echo "Installing Intel microcode"
    pacman -S --noconfirm --needed intel-ucode
    proc_ucode=intel-ucode.img
elif grep -E "AuthenticAMD" <<< ${proc_type}; then
    echo "Installing AMD microcode"
    pacman -S --noconfirm --needed amd-ucode
    proc_ucode=amd-ucode.img
fi

echo -ne "
-------------------------------------------------------------------------
                    package installation
-------------------------------------------------------------------------
"
yay -S --noconfirm afetch blueman base base-devel blueman bluez-tools brillo btop catppuccin-gtk-theme-mocha dunst file-roller firefox geeqie git gparted grim guvcview hyprland-git kitty libnotify light lightly-qt man-db mpv nano nemo nemo-fileroller neofetch nwg-look-bin obs-studio pamixer pavucontrol pipewire pipewire-alsa pipewire-audio pipewire-pulse pipewire-jack polkit polkit-kde-agent python-requests qogir-icon-theme qt5ct ranger rate-mirrors-bin rofi rofi-emoji sddm-catppuccin-git sddm-config-editor-git sddm-git slurp swappy swaybg swayidle swaylock-effects-git timeshift-bin tldr ttf-font-awesome vscodium-bin waybar webcord-bin wf-recorder wireplumber wlr-randr xdg-desktop-portal-hyprland xdg-user-dirs xed

echo -ne "
-------------------------------------------------------------------------
                    graphics drivers
-------------------------------------------------------------------------
"
# Graphics Drivers find and install
gpu_type=$(lspci)
if grep -E "NVIDIA|GeForce" <<< ${gpu_type}; then
    pacman -S --noconfirm --needed nvidia-dkms nvidia-settings nvidia-utils
elif lspci | grep 'VGA' | grep -E "Radeon|AMD"; then
    pacman -S --noconfirm --needed xf86-video-amdgpu
elif grep -E "Integrated Graphics Controller" <<< ${gpu_type}; then
    pacman -S --noconfirm --needed libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils lib32-mesa
elif grep -E "Intel Corporation UHD" <<< ${gpu_type}; then
    pacman -S --needed --noconfirm libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils lib32-mesa
fi

echo -ne "
-------------------------------------------------------------------------
                    enable sddm & set QT_QPA_PLATFORMTHEME
-------------------------------------------------------------------------
"
sudo systemctl enable sddm.service
#echo "QT_QPA_PLATFORMTHEME=qt5ct" | sudo cat >> /etc/environment

echo -ne "
-------------------------------------------------------------------------
                    fetch & install fonts
-------------------------------------------------------------------------
"

curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip
curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip
curl https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf
curl https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf
mkdir ~/.local/share/fonts
unzip ~/Downloads/JetBrainsMono.zip -d ~/.local/share/fonts
unzip ~/Downloads/Iosevka.zip -d ~/.local/share/fonts
mv  ~/Downloads/NotoColorEmoji.ttf ~/.local/share/fonts
mv  ~/Downloads/codicon.ttf ~/.local/share/fonts
fc-cache -fv

echo -ne "
-------------------------------------------------------------------------
                    DONE >:3
-------------------------------------------------------------------------
"

#game related packages
#lutris steam gamescope goverlay mangohud protonup-qt prismlauncher-bin


#/etc/environment
#QT_QPA_PLATFORMTHEME=qt5ct MANGOHUD=1
