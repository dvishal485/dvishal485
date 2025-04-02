#!/bin/bash

echo "this is a setup file to execute after linux installation to fulfil my requirements"

sudo apt update
sudo apt install libssl-dev -y

echo "VS Code installation"
sudo apt-get install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https -y
sudo apt update
sudo apt install code -y

echo "NeoVim installation"
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim -y

echo "Rust installation"
curl https://sh.rustup.rs -sSf | sh -s -- -y

echo "Java installation"
sudo apt install default-jre default-jdk -y
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH="$PATH:$JAVA_HOME/bin"

echo "cmdline-tools installation : Requires manual action"
cd ~/Downloads
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip cmdlinetools.zip -O cmdlinetools.zip
unzip ./cmdlinetools.zip
rm cmdlinetools.zip
cd ~/.local
mkdir packages && cd packages
mkdir android_sdk && cd android_sdk
mkdir cmdline-tools && cd cmdline-tools
mv ~/Downloads/cmdline-tools ./latest
sdkmanager --install "build-tools;34.0.0-rc2"
sdkmanager --install "platform-tools"
sdkmanager --install "platforms;android-33"
# temporarily export path variable
export ANDROID_SDK="$HOME/.local/packages/android_sdk"
export PATH="$PATH:$ANDROID_SDK/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_SDK/build-tools/34.0.0-rc2"
export PATH="$PATH:$ANDROID_SDK/platform-tools"

echo "Flutter 3.3.1 installation"
cd ~/Downloads
wget https://storage.googleapis.com/flutter_infra_release/releases/stable/linux/flutter_linux_3.3.1-stable.tar.xz -O flutter.tar.xz
tar xf ./flutter.tar.xz
rm flutter.tar.xz
mv ~/Downloads/flutter/ ~/.local/packages/
export PATH="$PATH:$HOME/.local/packages/flutter/bin"
sudo apt install clang cmake ninja-build libgtk-3-dev libstdc++-12-dev -y
flutter config --no-analytics

echo "NodeJS 18.15.0 installation"
cd ~/Downloads
wget https://nodejs.org/dist/v18.15.0/node-v18.15.0-linux-x64.tar.xz -O nodejs.tar.xz
tar xf ./nodejs.tar.xz
rm nodejs.tar.xz
mv ./node-v18.15.0-linux-x64 ~/.local/packages/node
export PATH="$PATH:$HOME/.local/packages/node/bin"

echo "Onlyoffice installation : Requires manual action"
cd ~/Downloads
wget https://download.onlyoffice.com/install/desktop/editors/linux/onlyoffice-desktopeditors_amd64.deb -O onlyoffice.deb
sudo apt install ./onlyoffice.deb -y

echo "Some more installation, updates and upgrades..."
sudo apt install dconf-editor obs-studio vlc xournalpp -y
rustup update
flutter upgrade
sudo apt update
sudo apt upgrade -y

echo "apt autopurge"
sudo apt autopurge

echo "Random apt ownership fix"
sudo chown -Rv _apt:root /var/cache/apt/archives/partial/
sudo chmod -Rv 700 /var/cache/apt/archives/partial/

echo "Installing leetcode-runner-cli"
cd ~/
mkdir Projects && cd ~/Projects
git clone https://github.com/dvishal485/leetcode-runner-cli.git
cd leetcode-runner-cli
cargo install --path .

echo "Installation finished..."
echo "Now manually export env variables from the end of script into ~/.profile"

export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"
export PATH="$PATH:$JAVA_HOME/bin"
export ANDROID_SDK="$HOME/.local/packages/android_sdk"
export PATH="$PATH:$ANDROID_SDK/cmdline-tools/latest/bin"
export PATH="$PATH:$ANDROID_SDK/build-tools/34.0.0-rc2"
export PATH="$PATH:$ANDROID_SDK/platform-tools"
export PATH="$PATH:$HOME/.local/packages/flutter/bin"
export PATH="$PATH:$HOME/.local/packages/node/bin"
