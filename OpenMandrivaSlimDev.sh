#!/bin/bash

# to update the system after computer name change (needs reboot after running this)
# sudo rm /tmp/.ICE-unix/*

sudo dnf install timeshift --assumeyes --refresh
# sudo dnf install dnf-plugins-core --assumeyes --refresh #probably already installed

sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo 
sudo dnf install brave-browser vlc plasma6-kalk --assumeyes --refresh # install browser, music and calculator

# install basic dev tools
sudo dnf install git kernel-desktop-gcc task-devel task-c-devel task-c++-devel clang lld llvm llvm-devel lldb cmake cmake-extras cmake-doc extra-cmake-modules --assumeyes --refresh 

# install base Qt6 dev components
sudo dnf install qtxdg-tools-devel qt6-qttools qt6-cmake cmake-qtgui qmake-qt6 qt6-qtbase-tools qt6-qtdeclarative plasma6-ksshaskpass qtxdg-tools-devel qt6-qtbase-theme-gtk3 --assumeyes --refresh
sudo dnf install lib64Qt6Sql-devel qt6-qtbase-sql-* --assumeyes --refresh
sudo dnf install *qt6quick* --assumeyes --refresh
sudo dnf install lib64Qt6Qml* --assumeyes --refresh
sudo dnf install amdvlk-vulkan-driver lib64vulkan-devel vulkan-headers vulkan-tools vulkan-volk --assumeyes --refresh
sudo dnf install libxml2 libxml2-utils libxml2-devel --assumeyes --refresh

# install lua
sudo dnf install --skip-broken lua luarocks lua-sql-sqlite lua-dbi-sqlite --assumeyes --refresh

# install sqlite base tools NOTE:sqlitebrowser requires extras repository enabled
sudo dnf install --skip-broken sqlite-tools --assumeyes --refresh

# install neovim
sudo dnf install --skip-broken neovim neovim-data --assumeyes --refresh

# require activating EXTRAS repository if you really want/need
# sudo dnf install lxappearance-obconf geany-plugins sqlitebrowser --assumeyes --refresh

# install DOOM emacs  ****** LAM requires activating EXTRAS repository  *******
sudo dnf install --skip-broken lam emacs emacs-el emacs-common emacs-doc emacs-elib --assumeyes --refresh
# lamboot came up as an issue on one previous test install but not on later ones
git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.config/emacs
$HOME/.config/emacs/bin/doom install
echo -e 'export PATH=$PATH:$HOME/.config/emacs/bin' | tee -a $HOME/.bashrc
echo -e 'export PATH=$PATH:$HOME/.config/emacs/bin' | tee -a $HOME/.profile

# install KDevelop 
sudo dnf install --skip-broken plasma6-kdevelop kdevplatform --assumeyes --refresh

# FOR THE LATEST OFFICIAL RELEASE OF QTCREATOR
# https://download.qt.io/official_releases/qtcreator/

# other Qt downloads can be found here
# https://download.qt.io/
