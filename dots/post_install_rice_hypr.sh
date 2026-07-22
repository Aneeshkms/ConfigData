echo "-~-~-~-~-~-~-~-~-~-~Install waybar matugen and rofi" && sleep 1
sudo pacman -S --needed waybar rofi-wayland awww 
yay -S matugen-bin
echo "-~-~-~-~-~-~-~-~-~-~ Configure waybar" && sleep 1
mkdir ~/.config/waybar
mkdir ~/.config/waybar/scripts
# TODO create wall paper folder and copy it
# Set wallpaper
# awww-daemon & disown  # TODO where should we do this???
# awww img ~/Pictures/wallpaper/????
# matugen image <path>
mkdir ~/.config/matugen
## 1:05 mins


