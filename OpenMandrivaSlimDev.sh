#!/bin/bash

# to update the system after computer name change aka. using a base vm image (needs reboot after running this)
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

#install Qt6 examples and docs
sudo dnf install qt6-qtwebsockets-examples qt6-qtwebchannel-examples qt6-qtvirtualkeyboard-examples qt6-qttools-examples qt6-qtserialport-examples qt6-qtserialbus-examples qt6-qtsensors-examples qt6-qtremoteobjects-examples qt6-qtquickeffectmaker-examples qt6-qtnetworkauth-examples qt6-qthttpserver-examples qt6-qtgraphs-examples qt6-qtdatavis3d-examples qt6-qtconnectivity-examples qt6-qtcharts-examples qt6-qtbase-examples qt6-qt5compat-examples qt6-qt3d-examples qt6-qtdeclarative-examples qt6-qtgrpc-examples qt6-qtlocation-examples qt6-qtmultimedia-examples qt6-qtpositioning-examples qt6-qtquick3d-examples qt6-qtquick3dphysics-examples qt6-qtscxml-examples qt6-qtspeech-examples qt6-qtwebengine-examples qt6-qtwebview-examples qt6-qtbase-doc qt6-qtdoc qt6-qttools-doc --assumeyes --refresh


# install lua
sudo dnf install --skip-broken lua luarocks lua-sql-sqlite lua-dbi-sqlite --assumeyes --refresh

# install sqlite base tools NOTE:sqlitebrowser requires extras repository enabled
sudo dnf install --skip-broken sqlite-tools sqlitebrowser --assumeyes --refresh

# install neovim
sudo dnf install --skip-broken neovim neovim-data --assumeyes --refresh
# get the kickstart
mkdir $HOME/.config/nvim/
git clone https://github.com/nvim-lua/kickstart.nvim.git $HOME/.config/nvim

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

#install Inkscape
sudo dnf install --skip-broken inkscape --assumeyes --refresh

# FOR THE LATEST OFFICIAL RELEASE OF QTCREATOR
# https://download.qt.io/official_releases/qtcreator/

# other Qt downloads can be found here
# https://download.qt.io/
