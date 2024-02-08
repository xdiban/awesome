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
yay -S npm zsh volctl picom lxsession redshift flameshot kitty nvim firefox i3lock xtrlock pcmanfm xfce4-power-manager network-manager-applet xorg-server xorg-xinit materia-gtk-theme capitaine-cursors lxapparence-gtk3 papirus-icon-theme blueman ripgrep alsa-utils brightnessctl ddcutil geoclue lxappearrance xclip neofetch -y
```

## Systemctl services
```
sudo systemctl enable --now geoclue.service
sudo systemctl enable --now bluetooth.service
```

## Picom config
```
mkdir ~/.config/picom
ln -s ~/.config/awesome/conf/picom.conf ~/.config/picom/picom.config
```

## Install NvChad
```
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
```

## Install Kitty Themes
```
git clone --depth 1 https://github.com/dexpota/kitty-themes.git ~/.config/kitty/kitty-themes
ln -sf ~/.config/kitty/kitty-themes/themes/IR_Black.conf ~/.config/kitty/theme.conf
echo include ./theme.conf > ~/.kitty.conf
```

## Configure lxappearance
```
lxappearance
```

## Install zsh and extentions
```
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
https://github.com/ryanoasis/nerd-fonts?tab=readme-ov-file#option-3-install-script
./install.sh
```
