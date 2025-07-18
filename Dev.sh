#/bin/bash

sudo apt update
sudo apt upgrade -y

####    INSTALL CLANG LLVM
sudo apt install -y clang-14 clang-14-doc clang-14-examples clang-tools-14 clang-format-14 clang-tidy-14 clangd-14 libclang-14-dev libclang-common-14-dev libclang1-14 liblldb-14-dev libopencl-clang-14-dev lldb-14 libclang-cpp14 libclang-cpp14-dev libclang-rt-14-dev
sudo apt install -y llvm-14 llvm-14-doc llvm-14-dev llvm-14-examples llvm-14-linker-tools llvm-14-runtime llvm-14-tools lld-14 lldb-14 libc++-14-dev libc++1-14 libc++abi-14-dev libc++abi1-14 liblld-14 liblld-14-dev liblldb-14 liblldb-14-dev libllvm14 libomp-14-dev libomp-14-doc libomp5-14
sudo atp install -y clang ccls clang-format clang-tidy clang-tools clangd clazy libclang-cpp-dev libclang-dev libclang1
sudo atp install -y libc++-dev libc++1 libc++abi-dev libc++abi1 liblld-dev liblldb-dev libomp-dev libomp5 lld lldb llvm llvm-dev llvm-runtime libstdc++-14-dev
sudo apt install -y cmake cmake-data cmake-doc cmake-extras cmake-format ninja-build generate-ninja
export PATH=$PATH:/usr/lib/llvm-14/bin
echo -e 'export PATH=$PATH:/usr/lib/llvm-14/bin' | tee -a $HOME/.bashrc
echo -e 'export PATH=$PATH:/usr/lib/llvm-14/bin' | tee -a $HOME/.profile



####   INSTALL LUA & LUAROCKS
curl -L -R -O https://www.lua.org/ftp/lua-5.4.7.tar.gz
tar zxf lua-5.4.7.tar.gz
cd lua-5.4.7
make all test
make all install INSTALL_TOP=~/.local/
cd ..
export PATH=$PATH:~/.local/bin
echo -e 'export PATH=$PATH:$HOME/.local/bin' | tee -a $HOME/.bashrc
echo -e 'export PATH=$PATH:$HOME/.local/bin' | tee -a $HOME/.profile
####    LUAROCK for later
####    wget https://luarocks.github.io/luarocks/releases/luarocks-3.11.1.tar.gz
####    ./configure --with-lua-bin=$HOME/.local/bin --prefix=$HOME/.local/
####    make install
####    OR
####    make bootstrap




####    INSTALL ZIG
# binary
wget https://ziglang.org/download/0.14.1/zig-x86_64-linux-0.14.1.tar.xz
# source
# wget https://ziglang.org/download/0.13.0/zig-0.13.0.tar.xz
tar -xvf zig-x86_64-linux-0.14.1.tar.xz --strip-components=1 --one-top-level=$HOME/.local/bin/zig
export PATH=$PATH:$HOME/.local/bin/zig
echo -e 'export PATH=$PATH:$HOME/.local/bin/zig' | tee -a $HOME/.bashrc
echo -e 'export PATH=$PATH:$HOME/.local/bin/zig' | tee -a $HOME/.profile



####    INSTALL ODIN
mkdir $HOME/.local/bin/odin
git clone https://github.com/odin-lang/Odin.git $HOME/.local/bin/odin
cd $HOME/.local/bin/odin
make release-native
cd $HOME/installscripts
export PATH=$PATH:$HOME/.local/bin/odin
echo -e 'export PATH=$PATH:$HOME/.local/bin/odin' | tee -a $HOME/.bashrc
echo -e 'export PATH=$PATH:$HOME/.local/bin/odin' | tee -a $HOME/.profile



####    INSTALL NeoVIM
sudo apt install ripgrep
# Now we install nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim-linux64
sudo mkdir -p /opt/nvim-linux64
sudo chmod a+rX /opt/nvim-linux64
sudo tar -C /opt -xzf nvim-linux64.tar.gz
# make it available in /usr/local/bin, distro installs to /usr/bin
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/
# get the kickstart
mkdir $HOME/.config/nvim/
git clone https://github.com/nvim-lua/kickstart.nvim.git $HOME/.config/nvim



####   INSTALL DOOM EMACS
sudo apt install -y emacs emacs-common emacs-el emacs-goodies-el emacs-intl-fonts sbcl xfonts-intl-asian elpa-rg elpa-cmake-mode elpa-format-all fd-find glslang-tools shellcheck python3-full python3-setuptools isort pipenv python3-pytest
git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.config/emacs
$HOME/.config/emacs/bin/doom install
export PATH=$PATH:$HOME/.config/emacs/bin
echo -e 'export PATH=$PATH:$HOME/.config/emacs/bin' | tee -a $HOME/.bashrc
echo -e 'export PATH=$PATH:$HOME/.config/emacs/bin' | tee -a $HOME/.profile




###    SQLITE
sudo apt install -y sqlite3 sqlite3-doc sqlite3-tools sqlitebrowser sqlite-utils
####   wget https://www.sqlite.org/src/tarball/sqlite.tar.gz?r=release -O sqlite.tar.gz




#### install QT5 and tools (upgraded to qt6 and removed some conflicting example packages)
#### sudo apt install -y qtcreator qtbase5-dev qtchooser qt5-qmake qtbase5-dev-tools qttools5-dev-tools clazy qml libqt5charts5-dev libqt5datavisualization5-dev libqt5gamepad5-dev libqt5gstreamer-dev libqt5networkauth5-dev libqt5opengl5-dev libqt5remoteobjects5-dev libqt5scxml5-dev libqt5sensors5-dev libqt5serialbus5-dev libqt5serialport5-dev libqt5svg5-dev libqt5texttospeech5-dev libqt5virtualkeyboard5-dev libqt5waylandclient5-dev libqt5waylandcompositor5-dev libqt5webkit5-dev libqt5webchannel5-dev libqt5websockets5-dev libqt5webview5-dev libqt5x11extras5-dev libqt5xmlpatterns5-dev
#### sudo apt install -y qtcreator qtcreator-data qtcreator-doc assistant-qt6 designer-qt6 designer-qt6-plugins qml-qt6 qdbus-qt6 qt6-base-dev qt6-base-dev-tools qt6-base-doc qt6-base-doc-dev qt6-base-doc-html qt6-base-examples qt6-charts-dev qt6-charts-doc qt6-charts-examples qt6-documentation-tools qt6-gtk-platformtheme qt6-image-formats-plugins qt6-imageformats-doc qt6-l10n-tools qt6-languageserver-dev qt6-networkauth-dev qt6-networkauth-doc qt6-networkauth-doc-dev qt6-networkauth-examples qt6-qmllint-plugins qt6-qmltooling-plugins qt6-svg-dev qt6-svg-doc qt6-svg-doc-dev qt6-svg-examples qt6-tools-dev qt6-tools-dev-tools qt6-tools-doc qt6-tools-doc-dev qt6-tools-examples qt6-translations-l10n qt6ct qtkeychain-qt6-dev 
sudo apt install -y qtcreator qtcreator-data qtcreator-doc assistant-qt6 designer-qt6 qml-qt6 qdbus-qt6 qt6-base-dev qt6-base-dev-tools qt6-base-doc qt6-base-doc-dev qt6-base-doc-html qt6-charts-dev qt6-charts-doc qt6-documentation-tools qt6-gtk-platformtheme qt6-image-formats-plugins qt6-imageformats-doc qt6-l10n-tools qt6-languageserver-dev qt6-networkauth-dev qt6-networkauth-doc qt6-networkauth-doc-dev qt6-qmllint-plugins qt6-qmltooling-plugins qt6-svg-dev qt6-svg-doc qt6-svg-doc-dev qt6-tools-dev qt6-tools-dev-tools qt6-tools-doc qt6-tools-doc-dev qt6-translations-l10n qt6ct qtkeychain-qt6-dev 
#### install files for QtQuick
sudo apt install -y qt6-declarative-dev libqt6chartsqml6 libqt6datavisualizationqml6 libqt6remoteobjectsqml6 libqt6scxmlqml6 libqt6statemachineqml6 libqt6webenginequickdelegatesqml6 qml6-module-qt-labs-animation qml6-module-qt-labs-folderlistmodel qml6-module-qt-labs-lottieqt qml6-module-qt-labs-platform qml6-module-qt-labs-qmlmodels qml6-module-qt-labs-settings qml6-module-qt-labs-sharedimage qml6-module-qt-labs-wavefrontmesh qml6-module-qt3d-animation qml6-module-qt3d-core qml6-module-qt3d-extras qml6-module-qt3d-input qml6-module-qt3d-logic qml6-module-qt3d-render qml6-module-qt5compat-graphicaleffects qml6-module-qtcharts qml6-module-qtcore qml6-module-qtdatavisualization qml6-module-qtmultimedia qml6-module-qtpositioning qml6-module-qtqml qml6-module-qtqml-models qml6-module-qtqml-statemachine qml6-module-qtqml-workerscript qml6-module-qtqml-xmllistmodel qml6-module-qtquick-dialogs qml6-module-qtquick-localstorage qml6-module-qtquick-nativestyle qml6-module-qtquick-particles qml6-module-qtquick-pdf qml6-module-qtquick-scene2d qml6-module-qtquick-scene3d qml6-module-qtquick-shapes qml6-module-qtquick-templates qml6-module-qtquick-timeline qml6-module-qtquick-tooling qml6-module-qtquick-virtualkeyboard qml6-module-qtquick-window qml6-module-qtquick3d-physics qml6-module-qtquick3d-spatialaudio qml6-module-qtremoteobjects qml6-module-qtscxml qml6-module-qtsensors qml6-module-qttest qml6-module-qttexttospeech qml6-module-qtwayland-client-texturesharing qml6-module-qtwayland-compositor qml6-module-qtwebchannel qml6-module-qtwebengine qml6-module-qtwebengine-controlsdelegates qml6-module-qtwebsockets qml6-module-qtwebview qml6-module-quick3d qml6-module-quick3d-assetutils qml6-module-quick3d-effects qml6-module-quick3d-helpers qml6-module-quick3d-particleeffects qml6-module-quick3d-particles3d
#### in order to use git with QtCreator
sudo apt install -y ssh-askpass



#### install Inkscape
sudo apt install -y inkscape inkscape-open-symbols inkscape-textext inkscape-textext-doc inkscape-tutorials




