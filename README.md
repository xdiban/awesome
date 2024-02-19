# Installation

## Update keyring
```
sudo pacman -Sy archlinux-keyring
```

## Update system
```
yay -Syu
```

## Install dependencies
```
yay -S awesome-git npm zsh volctl picom lxsession redshift flameshot kitty nvim firefox i3lock xtrlock pcmanfm xfce4-power-manager network-manager-applet xorg-server xorg-xinit materia-gtk-theme capitaine-cursors lxapparence-gtk3 papirus-icon-theme blueman ripgrep alsa-utils brightnessctl ddcutil geoclue lxappearrance xclip neofetch xf86-input-synaptics acpi rofi noto-fonts-cjk betterlockscreen -y
```

## Systemctl services
```
sudo systemctl enable --now geoclue.service
sudo systemctl enable --now bluetooth.service
```

## Picom config
```
mkdir ~/.config/picom && ln -sf ~/.config/awesome/conf/picom.conf ~/.config/picom/picom.config
```

## Install NvChad
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

## Install Kitty Themes
```
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
ln -sf ~/.config/kitty/kitty-themes/themes/IR_Black.conf ~/.config/kitty/theme.conf
echo include ./theme.conf > ~/.config/kitty/kitty.conf
```

## Configure lxappearance
```
lxappearance
```

## Configure sleep and lock
```
xfconf-query --create -c xfce4-session -p /general/LockCommand -t string -s "betterlockscreen --lock"
```

## Install zsh and extentions
```
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#option-3-install-script
./install.sh
```

## Synaptics config
```
sudo cp ~/.config/awesome/conf/synaptics.conf /etc/X11/xorg.conf.d/70-synaptics.conf
```

## Install ARC Icon Theme
```
git clone https://github.com/horst3180/arc-icon-theme --depth 1 && cd arc-icon-theme
./autogen.sh --prefix=/usr
sudo make install
```

## Rofi Config
```
ln -sf ~/.config/awesome/conf/rofi/config.rasi ~/.config/rofi/config.rasi
```
