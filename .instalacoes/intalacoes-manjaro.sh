#! /bin/sh

sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# yay
sudo pacman -Syu yay

# make
yay -Syu --noconfirm make

# sublime
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && sudo pacman-key --add sublimehq-pub.gpg && sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf
yay -Syu --noconfirm sublime-text

# code
yay -Syu --noconfirm visual-studio-code-bin

# telegram
yay -Syu --noconfirm telegram-desktop

# Notion
yay -Syu --noconfirm notion-app-enhanced

# pip / pipx / poetry
yay -Syu --noconfirm python-pip
yay -Syu --noconfirm python-pipx
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -
poetry config virtualenvs.in-project true

# imagemagick
yay -Syu --noconfirm imagemagick

# asdf
yay -Syu --noconfirm asdf-vm
asdf plugin-add java
asdf plugin-add nodejs
asdf plugin-add maven
asdf plugin-add yarn
asdf plugin-add python

# java
asdf list-all java
asdf install java adoptopenjdk-11.0.14+101
asdf global java adoptopenjdk-11.0.14+101
asdf install maven 3.8.4
asdf global maven 3.8.4

# nodejs
asdf install nodejs lts
asdf global nodejs lts
asdf install yarn latest
asdf global yarn latest

# python
asdf list-all python
asdf install python 3.10.2
asdf global python 3.10.2

#qbittorrent
yay -Syu --noconfirm qbittorrent

# dconf-editor
yay -Syu --noconfirm dconf-editor

# kolourpaint
yay -Syu --noconfirm kolourpaint

# flameshot
yay -Syu --noconfirm flameshot

# krita
yay -Syu --noconfirm krita

# gnome tweaks
yay -Syu --noconfirm gnome-tweaks

# timeshift
yay -Syu --noconfirm timeshift

# inkscape
yay -Syu --noconfirm inkscape

# gimp
yay -Syu --noconfirm gimp

# gh
yay -Syu --noconfirm github-cli

# ocs-url
yay -Syu --noconfirm ocs-url

# firefox
yay -R --noconfirm firefox-gnome-theme-maia

# insync
yay -Syu --noconfirm insync

# whatsapp
yay -Syu --noconfirm whatsapp-nativefier

# discord
yay -Syu --noconfirm discord

# insomnia
yay -Syu --noconfirm insomnia

# mailspring
yay -Syu --noconfirm mailspring

# bat
yay -Syu --noconfirm bat

# exa
yay -Syu --noconfirm exa

# intellij
yay -Syu --noconfirm intellij-idea-ultimate-edition
yay -Syu --noconfirm intellij-idea-ultimate-edition-jre
