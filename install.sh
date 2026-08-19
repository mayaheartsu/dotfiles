#!/bin/sh

clear
echo -ne "
-------------------------------------------------------------------------
                    mayadots installer 
-------------------------------------------------------------------------
this script is intended for personal use. no promises things will work. >:3
INTENDED TO BE USED IMMEDIATELY AFTER A CACHYOS INSTALL
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

yay -S --noconfirm adw-gtk-theme afetch alsa-firmware alsa-scarlett-gui amdgpu-top base base-devel bitwarden blueman bluez-tools brillo btop clipse discord dunst fastfetch file-roller firefox fzf geeqie gimp git github-desktop gparted grim guvcview harbor-stremio-bin helium-browser-bin hyfetch hyprland hyprcursor hypridle hyprlang hyprlauncher hyprlock hyprpaper hyprpolkitagent hyprsysteminfo inter-font kitty libnotify light linux-headers localsend ly man-db meld mpv nano nemo nemo-fileroller noctalia noctalia-shell noto-fonts-cjk noto-fonts-emoji nwg-look obs-studio oh-my-posh-bin pamixer papirus-icon-theme pavucontrol pipewire pipewire-alsa pipewire-audio pipewire-pulse pipewire-jack polkit protonplus prismlauncher proton-vpn-gtk-app python-requests qt6ct ranger reflector rofi-wayland rofi-emoji scarlett2-firmware scopebuddy scopebuddy-gui shelly sidra-bin slurp steam-devices stow swappy swaync syncthing tenacity tealdeer ttf-cascadia-code-nerd ttf-font-awesome waybar wf-recorder wl-clipboard wget wireplumber wlogout wlr-randr xdg-desktop-portal-hyprland xdg-user-dirs xed yazi zoxide zsh
# timeshift not installed in favor of cachyos-snapper-support

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
gpu_type=$(lspci)
if grep -E "NVIDIA|GeForce" <<< ${gpu_type}; then
  sudo systemctl enable nvidia-suspend.service
  sudo systemctl enable nvidia-hibernate.service 
  sudo systemctl enable nvidia-resume.service
elif lspci | grep 'VGA' | grep -E "Radeon|AMD"; then
  clear
elif grep -E "Integrated Graphics Controller" <<< ${gpu_type}; then
  clear
elif grep -E "Intel Corporation UHD" <<< ${gpu_type}; then
  clear
fi

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
#wget https://github.com/microsoft/vscode-codicons/raw/main/dist/codicon.ttf -P ~/Downloads
mkdir ~/.local
mkdir ~/.local/share
mkdir ~/.local/share/fonts
unzip ~/Downloads/JetBrainsMono.zip -d ~/.local/share/fonts
unzip ~/Downloads/Iosevka.zip -d ~/.local/share/fonts
mv  ~/Downloads/NotoColorEmoji.ttf ~/.local/share/fonts
#mv  ~/Downloads/codicon.ttf ~/.local/share/fonts
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
cp ~/dotfiles/.bashrc ~/


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

# Quick reference to steam launch options 

#xwayland route (non hdr games)
#IF a game is listed as dx11/x12 or older OR vulkan and doesn't support hdr (most dx11 games don't) or is dx9 or older, then we just use xwayland and skip native wine-wayland, let hyprland do the color swapchain
#game-performance mangohud ENABLE_LAYER_MESA_ANTI_LAG=1 %command% /WineDetectionEnabled:False

#wine-wayland route (hdr games)
#IF a game is a modern dx12 or dx 11 or vulkan title that DOES support hdr the we use wine-wayland and skip running xwayland entirely, letting the game itself handle the color swapchain
#game-performance mangohud DXVK_HDR=1 PROTON_FSR4_UPGRADE=1 PROTON_ENABLE_WAYLAND=1 PROTON_ENABLE_HDR=1 ENABLE_LAYER_MESA_ANTI_LAG=1 WAYLANDDRV_PRIMARY_MONITOR=DP-1 %command% /WineDetectionEnabled:False
