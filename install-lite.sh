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

yay -S --noconfirm afetch base base-devel bitwarden blueman bluez-tools brillo btop catppuccin-gtk-theme-mocha clipse darkly-bin discord dunst fastfetch file-roller firefox fzf geeqie gimp git gparted grim guvcview helium-browser-bin hyfetch hyprland hyprcursor hypridle hyprlang hyprlauncher hyprlock hyprpaper hyprpolkitagent hyprsysteminfo inter-font kitty libnotify light linux-headers localsend ly man-db meld mpv nano nemo nemo-fileroller noctalia-shell noto-fonts-cjk noto-fonts-emoji nwg-look obs-studio oh-my-posh-bin pamixer pavucontrol pipewire pipewire-alsa pipewire-audio pipewire-pulse pipewire-jack polkit polkit-kde-agent proton-vpn-gtk-app python-requests qogir-icon-theme qt5ct ranger reflector rofi-wayland rofi-emoji rose-pine-cursor rose-pine-hyprcursor slurp stow swappy swaync syncthing tenacity tealdeer ttf-cascadia-code-nerd ttf-font-awesome waybar wf-recorder wl-clipboard wget wireplumber wlogout wlr-randr xdg-desktop-portal-hyprland xdg-user-dirs xed yazi zoxide zsh
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

#optional game related packages
#lutris steam gamemode gamescope goverlay mangohud protonup-qt prismlauncher-bin legcord-bin


#/etc/environment
#QT_QPA_PLATFORMTHEME=qt5ct MANGOHUD=1
# 
# game-performance mangohud PROTON_FSR4_UPGRADE=1 DXVK_ASYNC=1 PROTON_ENABLE_WAYLAND=1 PROTON_ENABLE_HDR=1 ENABLE_HDR_WSI=1 ENABLE_LAYER_MESA_ANTI_LAG=1 WAYLANDDRV_PRIMARY_MONITOR=DP-1 %command% /WineDetectionEnabled:False
