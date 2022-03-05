#! /bin/sh

sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# Git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update
sudo apt upgrade -y
sudo apt install -y git

# varied programs
sudo apt install -y curl unrar xclip python3-pip imagemagick apt-transport-https p7zip-full p7zip-rar default-jdk qbittorrent maven pdftk pdfchain dconf-editor telegram-desktop kolourpaint flameshot krita img2pdf simplescreenrecorder vlc build-essential pkg-config libvlccore-dev libvlc-dev gnome-tweaks chrome-gnome-shell timeshift peek libev-dev libx11-dev libxi-dev gpick inkscape gimp

# Notion
echo "deb [trusted=yes] https://apt.fury.io/notion-repackaged/ /" | sudo tee /etc/apt/sources.list.d/notion-repackaged.list
sudo apt update
sudo apt upgrade -y
sudo apt install -y notion-app

# Sublime Text
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt upgrade -y
sudo apt install -y sublime-text

# gh
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo gpg --dearmor -o /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list >/dev/null
sudo apt update
sudo apt upgrade -y
sudo apt install -y gh

# vscode
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor >packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt upgrade -y
sudo apt install -y code

# intellij
curl -s https://s3.eu-central-1.amazonaws.com/jetbrains-ppa/0xA6E8698A.pub.asc | sudo apt-key add -
echo "deb http://jetbrains-ppa.s3-website.eu-central-1.amazonaws.com bionic main" | sudo tee /etc/apt/sources.list.d/jetbrains-ppa.list >/dev/null
sudo apt update
sudo apt upgrade -y
sudo apt install -y intellij-idea-ultimate

# youtube-dl
pip3 install --upgrade youtube-dl

# flatpacks
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub -y com.discordapp.Discord
flatpak install flathub -y rest.insomnia.Insomnia
flatpak install flathub -y io.github.Figma_Linux.figma_linux

# Docker
sudo apt install -y \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list >/dev/null
sudo apt update
sudo apt upgrade -y
sudo apt install docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
newgrp docker
