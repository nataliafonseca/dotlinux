#! /bin/sh

sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

sudo pacman -Syu

# yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && cd .. && rm -rf yay

# programs
yay -S --noconfirm notion-app
yay -S --noconfirm jdk11-openjdk
yay -S --noconfirm sublime-text-4
yay -S --noconfirm insync
yay -S --noconfirm nvm
yay -S --noconfirm docker
yay -S --noconfirm docker-compose
yay -S --noconfirm python-pip
yay -S --noconfirm python-pipx
yay -S --noconfirm visual-studio-code-bin
yay -S --noconfirm telegram-desktop
yay -S --noconfirm github-cli
yay -S --noconfirm make
yay -S --noconfirm imagemagick
yay -S --noconfirm qbittorrent
yay -S --noconfirm dconf-editor
yay -S --noconfirm kolourpaint
yay -S --noconfirm flameshot
yay -S --noconfirm krita
yay -S --noconfirm timeshift
yay -S --noconfirm ocs-url
yay -S --noconfirm whatsapp-nativefier
yay -S --noconfirm discord
yay -S --noconfirm insomnia
yay -S --noconfirm mailspring
yay -S --noconfirm beekeeper-studio-bin
yay -S --noconfirm teams
yay -S --noconfirm bat
yay -S --noconfirm exa
yay -S --noconfirm nemo
yay -S --noconfirm chrome-gnome-shell
yay -S --noconfirm libreoffice-fresh
yay -S --noconfirm ttf-ms-win11-auto
yay -S --noconfirm fzf
yay -S --noconfirm grub-customizer
yay -S --noconfirm ntfs-3g
yay -S --noconfirm figma-linux

# poetry
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
poetry config virtualenvs.in-project true

# node
nvm install --lts
nvm use --lts
npm install -g yarn
npm install -g json-server
npm install -g sync-dotenv
npm install -g degit
npm install -g @nestjs/cli
