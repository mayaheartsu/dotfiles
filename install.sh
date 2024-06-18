#!/bin/sh

clear
echo -ne "
-------------------------------------------------------------------------
                    mayadots installer 
-------------------------------------------------------------------------
this script is intended for personal use. no promises things will work. >:3
"
sleep 5

clear
echo -ne "
-------------------------------------------------------------------------
                     yay
-------------------------------------------------------------------------
"
sleep 5

git clone https://aur.archlinux.org/yay-bin /tmp/yay
pushd /tmp/yay/
makepkg -si --needed PKGBUILD
popd


clear
echo -ne "
-------------------------------------------------------------------------
                    reflector + mirror sort
-------------------------------------------------------------------------
"
sleep 5

yay -S --noconfirm reflector
sudo reflector --country 'United States' --latest 5 --age 2 --fastest 5 --protocol https --sort rate --save /etc/pacman.d/mirrorlist


clear
echo -ne "
-------------------------------------------------------------------------
                    cpu microcode
-------------------------------------------------------------------------
"
sleep 5

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


clear
echo -ne "
-------------------------------------------------------------------------
                    packages
-------------------------------------------------------------------------
"
sleep 5

yay -S --noconfirm afetch blueman base base-devel blueman bluez-tools brillo btop catppuccin-gtk-theme-mocha dunst fastfetch file-roller firefox fzf geeqie git gparted grim guvcview hyfetch hyprland hyprcursor hypridle hyprlang hyprlock hyprpaper keepassxc kitty libnotify light lightly-qt linux-headers ly man-db mpv nano nemo nemo-fileroller noto-fonts-cjk noto-fonts-emoji nwg-look-bin obs-studio oh-my-posh-bin pamixer pavucontrol pipewire pipewire-alsa pipewire-audio pipewire-pulse pipewire-jack polkit polkit-kde-agent python-requests qogir-icon-theme qt5ct ranger reflector rofi rofi-emoji rose-pine-cursor rose-pine-hyprcursor slurp stow swappy swaync syncthing timeshift tldr ttf-font-awesome waybar wf-recorder wget wireplumber wlogout wlr-randr xdg-desktop-portal-hyprland xdg-user-dirs xed zoxide zsh


clear
echo -ne "
-------------------------------------------------------------------------
                    graphics drivers
-------------------------------------------------------------------------
"
sleep 5

# Graphics Drivers find and install
gpu_type=$(lspci)
if grep -E "NVIDIA|GeForce" <<< ${gpu_type}; then
   sudo pacman -S --noconfirm --needed nvidia-dkms nvidia-settings nvidia-utils
elif lspci | grep 'VGA' | grep -E "Radeon|AMD"; then
  sudo  pacman -S --noconfirm --needed xf86-video-amdgpu
elif grep -E "Integrated Graphics Controller" <<< ${gpu_type}; then
  sudo  pacman -S --noconfirm --needed libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils lib32-mesa
elif grep -E "Intel Corporation UHD" <<< ${gpu_type}; then
   sudo pacman -S --needed --noconfirm libva-intel-driver libvdpau-va-gl lib32-vulkan-intel vulkan-intel libva-intel-driver libva-utils lib32-mesa
fi


clear
echo -ne "
-------------------------------------------------------------------------
                    enable services
-------------------------------------------------------------------------
"
sleep 5

# sudo systemctl enable sddm.service
sudo systemctl enable ly
sudo systemctl enable nvidia-suspend.service
sudo systemctl enable nvidia-hibernate.service 
sudo systemctl enable nvidia-resume.service


clear
echo -ne "
-------------------------------------------------------------------------
                    fetch & install fonts
-------------------------------------------------------------------------
"
sleep 5

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip -P ~/Downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip -P ~/Downloads
wget https://github.com/googlefonts/noto-emoji/raw/main/fonts/NotoColorEmoji.ttf -P ~/Downloads
wget https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf -P ~/Downloads
mkdir ~/.local
mkdir ~/.local/share
mkdir ~/.local/share/fonts
unzip ~/Downloads/JetBrainsMono.zip -d ~/.local/share/fonts
unzip ~/Downloads/Iosevka.zip -d ~/.local/share/fonts
mv  ~/Downloads/NotoColorEmoji.ttf ~/.local/share/fonts
mv  ~/Downloads/codicon.ttf ~/.local/share/fonts
fc-cache -fv


clear
echo -ne "
-------------------------------------------------------------------------
                    copy config files
-------------------------------------------------------------------------
"
sleep 5

cp -r ~/dotfiles/.config/* ~/.config
cp ~/dotfiles/.p10k.zsh ~/
cp ~/dotfiles/.zshrc ~/


clear
echo -ne "
-------------------------------------------------------------------------
                    change shell to zsh
-------------------------------------------------------------------------
"
sleep 5

chsh -s /usr/bin/zsh


clear
echo -ne "
-------------------------------------------------------------------------
                    DONE >:3 exiting...
-------------------------------------------------------------------------
"
sleep 10

#optional game related packages
#lutris steam gamemode gamescope goverlay mangohud protonup-qt prismlauncher-bin


#/etc/environment
#QT_QPA_PLATFORMTHEME=qt5ct MANGOHUD=1
