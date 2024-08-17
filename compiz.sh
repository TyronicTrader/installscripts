#bin/bash

# Create folders in user directory (eg. Documents,Downloads,etc.)
xdg-user-dirs-update

# Terminal (eg. terminator,kitty,xfce4-terminal) clipboard
# sudo apt install -y kitty tilix tmux parcellite
sudo apt install -y alacritty

# Network File Tools/System Events
#sudo apt install -y dialog mtools dosfstools avahi-daemon acpi acpid xfce4-power-manager
sudo apt install -y cifs-utils smbclient

# install terminal filemanager (ranger requires xorg but nnn does not so putting it here first)
sudo apt install -y nnn

# Base install files for base setup or development
#sudo apt install -y dkms linux-headers-$(uname -r) build-essentials
sudo apt install -y curl ripgrep unzip

# Fonts and icons for now
sudo apt install -y fonts-recommended fonts-ubuntu fonts-font-awesome fonts-terminus papirus-icon-theme fonts-noto fonts-anonymous-pro

# base xorg diplay server installation (gvfs-backends & ranger require xorg so put them in here)
sudo apt install -y xorg xbindkeys xinput xclip xarchiver gvfs-backends ranger
#sudo apt install -y xscreensaver-data-extra xscreensaver-gl-extra xvkbd xbacklight

# Base GUI
sudo apt install -y lxde-core compiz compiz-bcop compiz-core compiz-dev compiz-gnome compiz-plugins compiz-plugins-default compiz-plugins-extra compiz-plugins-main compizconfig-settings-manager


# Sound packages so we can hear vids in browser and also for Android Studio (need pulseaudio for it instead of pipewire)
sudo apt install -y pulseaudio alsa-utils pavucontrol volumeicon-alsa pamixer

# Installation for Appearance management so we can have dark mode
sudo apt install -y lxappearance breeze-gtk-theme breeze-icon-theme

# Base utils
sudo apt install -y timeshift galculator p7zip-rar
sudo apt install -y thunar thunar-archive-plugin thunar-data thunar-font-manager thunar-media-tags-plugin thunar-vcs-plugin thunar-volman
sudo apt install -y geany
sudo apt install -y geany-plugin-addons geany-plugin-git-changebar geany-plugin-overview geany-plugin-spellcheck geany-plugin-treebrowser geany-plugin-vimode
sudo apt install -y geany-plugins \ # all plugins
git clone https://github.com/TyronicTrader/geany-themes.git ~/Downloads
mkdir ~/.config/geany/
mkdir ~/.config/geany/colorschemes/
mv ~/Downloads/colorschemes/* ~/.config/geany/colorschemes/

# install Brave Browser
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/

# get the kickstart
mkdir ~/.config/nvim/
git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

# cleanup
sudo apt autoremove -y

printf "\e[1;32m ## UPDATE lxsession-LXDE-desktop.conf with compiz  ## UPDATE VitrualBox client tools after rebooting ## \e[0m\n"
