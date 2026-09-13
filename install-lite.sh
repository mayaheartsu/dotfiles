#!/bin/sh

clear
echo -ne "
-------------------------------------------------------------------------
                    mayadots installer - lite
-------------------------------------------------------------------------
this script is intended for personal use. no promises things will work. >:3
INTENDED TO BE USED IMMEDIATELY AFTER A CACHYOS INSTALL
"
sleep 5

clear
echo -ne "
-------------------------------------------------------------------------
                    packages
-------------------------------------------------------------------------
"
sleep 5

yay -S --noconfirm adw-gtk-theme afetch alsa-firmware alsa-scarlett-gui amdgpu-top base base-devel bitwarden blueman bluez-tools brillo btop clipse discord dunst eza fastfetch file-roller firefox fzf geeqie gimp git github-desktop gparted grim guvcview harbor-stremio-bin helium-browser-bin hyfetch hyprland hyprcursor hypridle hyprlang hyprlauncher hyprlock hyprpaper hyprpolkitagent hyprsysteminfo inter-font kitty lact libnotify light linux-headers localsend ly man-db meld mpv nano nemo nemo-fileroller noctalia noctalia-shell noto-fonts-cjk noto-fonts-emoji nwg-look obs-studio oh-my-posh-bin pamixer papirus-icon-theme pavucontrol pipewire pipewire-alsa pipewire-audio pipewire-pulse pipewire-jack polkit protonplus prismlauncher proton-vpn-gtk-app prismlauncher python-requests qt6ct ranger reflector rofi-wayland rofi-emoji scarlett2-firmware scopebuddy scopebuddy-gui shelly sidra-bin slurp steam-devices stow swappy swaync syncthing tenacity tealdeer ttf-cascadia-code-nerd ttf-font-awesome waybar wf-recorder wl-clipboard wget wireplumber wlogout wlr-randr xdg-desktop-portal-hyprland xdg-user-dirs xed yazi zoxide zsh
# timeshift not installed in favor of cachyos-snapper-support

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
