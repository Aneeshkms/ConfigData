echo "Updating system . . ." && sleep 1
sudo pacman -Syu
echo "-~-~-~-~-~-~-~-~-~-~Installing rsync" && sleep 1
sudo pacman -S rsync
echo "Updating mirrorlist . . ." && sleep 1
sudo pacman -S reflector
sudo reflector --country India --country Singapore --sort rate --save /etc/pacman.d/mirrorlist
# echo "-~-~-~-~-~-~-~-~-~-~Installing amd-ucode " && sleep 1
# sudo pacman -S --needed amd-ucode 
# For NVIDIA set below env vars
# export LIBVA_DRIVER_NAME='nvidia'
# export __GLX_VENDOR_LIBRARY_NAME='nvidia'
# Intel Graphics: mesa intel-media-driver
# AMD Graphics: mesa libva-mesa-driver
# NVIDIA Graphics: nvidia nvidia-utils
# Critical for Nvidia: You must add nvidia_drm.modeset=1 to your kernel parameters.
# Also, if you run into screen flickering, you will want aquamarine
# (Hyprland's rendering backend helper) which usually pulls in automatically,
# but double-check its documentation if things look weird.
#
# power-profiles-daemon for laptop power management
# brightnessctl for controlling laptop brightness
echo "-~-~-~-~-~-~-~-~-~-~Installing networkmanager" && sleep 1
sudo pacman -S --needed networkmanager
sudo systemctl enable NetworkManager.service
echo "-~-~-~-~-~-~-~-~-~-~Installing neovim  optionally link vim and vi to nvim. . ." && sleep 1
sudo pacman -S --needed neovim
echo "-~-~-~-~-~-~-~-~-~-~Installing base-devel and git . . ." && sleep 1
sudo pacman -S --needed base-devel git
echo "-~-~-~-~-~-~-~-~-~-~Installing openssh . . ." && sleep 1
sudo pacman -S --needed openssh
sudo systemctl start sshd
sudo systemctl enable sshd
# Edit /etc/ssh/ssh_config to enable password login
# Uncomment or set below line
# PasswordAuthenticaion yes
sudo sed -i 's/^# \+PasswordAuth/PasswordAuth/' /etc/ssh/ssh_config
echo "-~-~-~-~-~-~-~-~-~-~Installing yay . . ." && sleep 1
mkdir Downloads && cd Downloads
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
echo "-~-~-~-~-~-~-~-~-~-~Installing thunar, lf, yazi , command line file file browser . . ." && sleep 1
sudo pacman -S --needed thunar lf yazi
sudo pacman -S --needed gvfs thunar-volman  # For usb automount
echo "-~-~-~-~-~-~-~-~-~-~Installing basic essentials - wget/curl/zip/tree" && sleep 1
sudo pacman -S --needed wget curl zip unzip gzip tree
echo "-~-~-~-~-~-~-~-~-~-~Adding some common aliases" && sleep 1
# TODO add a if check here
echo "### Custom aliases ###" >> ~/.bashrc
echo "alias ll='ls -alt' " >> ~/.bashrc
echo "alias lR='ls -altR' " >> ~/.bashrc
echo "alias vim='nvim' " >> ~/.bashrc
echo "alias vi='nvim' " >> ~/.bashrc
echo "set -o vi " >> ~/.bashrc
source ~/.bashrc
echo "-~-~-~-~-~-~-~-~-~-~Install nerd fonts" && sleep 1
# See if below needed or not 
# System & Monospace Fonts: ttf-inter (clean UI font) or ttf-jetbrains-mono.
# The Icons (Crucial for Waybar): ttf-nerd-fonts-symbols or a specific patched font like ttf-jetbrains-mono-nerd.
# Emojis: noto-fonts-emoji so browsers and chat apps don't crash or look blank when displaying emojis. 
#
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Inconsolata.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
unzip -o Inconsolata.zip -d ~/.local/share/fonts
rm Inconsolata.zip
unzip -o JetBrainsMono.zip -d ~/.local/share/fonts
rm JetBrainsMono.zip
yay -S otf-font-awesome
# fc-cache -fv ## Not needed as hyprland will do it
echo "-~-~-~-~-~-~-~-~-~-~Installing hyprland essentials" && sleep 1
sudo pacman -S --needed hyprland xdg-desktop-portal-hyprland xdg-desktop-portal-gtk kitty
# xdg-desktop-portal ???
# uwsm ???
# echo "if uwsm check may-start; then" >> ~/.bashrc
# echo "    exec uwsm start hyprland.desktop" >> ~/.bashrc
# echo "fi" >> ~/.bashrc
sudo pacman -S --needed hyprpolkitagent hypridle hyprlock hyprpicker
sudo pacman -S --needed wlogout # TODO configuration and styling
echo "-~-~-~-~-~-~-~-~-~-~Installing notification/" && sleep 1
sudo pacman -S --needed swaync   # TODO  configure swaync
echo "-~-~-~-~-~-~-~-~-~-~Installing screenshot / swappy for screenshot editing" && sleep 1
sudo pacman -S --needed grim slurp swappy  
# TODO grim captures screen, slurp helps to select, swappy helps to do minimal edit
# Configure these in hyprland
echo "-~-~-~-~-~-~-~-~-~-~Installing wl-clipboard for clipboard wl-copy and wl-paste" && sleep 1
sudo pacman -S --needed wl-clipboard cliphist
# TODO In hyprland config
## Watch clipboard for text copies
# exec-once = wl-paste --type text --watch cliphist store
## Watch clipboard for image/screenshot copies
# exec-once = wl-paste --type image --watch cliphist store
## Add a keybinding to get from history and show for rofi
# bind = $mainMod, V, exec, cliphist list | rofi -dmenu -p "Clipboard:" | cliphist decode | wl-copy
echo "-~-~-~-~-~-~-~-~-~-~Installing audio essentials" && sleep 1
sudo pacman -S --needed pipewire wireplumber pipewire-alsa pipewire-pulse pipewire-jack
echo "-~-~-~-~-~-~-~-~-~-~Installing audio volume controller pavucontrol" && sleep 1
sudo pacman -S --needed pavucontrol
# hyprpwcenter ??
echo "-~-~-~-~-~-~-~-~-~-~Installing bluetooth essentials and enable" && sleep 1
sudo pacman -S --needed bluez bluez-utils blueman
sudo systemctl enable bluetooth
echo "-~-~-~-~-~-~-~-~-~-~Installing browsers" && sleep 1
sudo pacman -S --needed firefox qutebrowser
yay -S brave-bin
# TODO basic firewall setup - needed? how to ?
# TRIM tells your SSD controller which blocks of data are no longer needed so it can wipe them in the background,
# keeping your write speeds fast and extending the life of your drive.
# sudo systemctl enable --now fstrim.timer
# Install and configure timeshift
# Explore - Smart Memory Management (ZRAM / Swap)
# sudo pacman -S zram-generator
