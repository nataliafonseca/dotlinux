#! /bin/sh

sudo -v
# Keep-alive: update existing sudo time stamp if set, otherwise do nothing.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done 2>/dev/null &

# flathub
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# dash-to-dock
sudo dnf install -y gnome-shell-extension-dash-to-dock
sudo dnf install -y gnome-extensions-app

# Sublime
sudo rpm -v --import https://download.sublimetext.com/sublimehq-rpm-pub.gpg
sudo dnf config-manager --add-repo https://download.sublimetext.com/rpm/stable/x86_64/sublime-text.repo
sudo dnf install -y sublime-texty

# pip
sudo dnf install -y python3-pip
sudo dnf install -y pipx
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

# imagemagick
sudo dnf install -y ImageMagick

# java
sudo dnf install -y java-11-openjdk-devel.x86_64
sudo dnf install -y java-17-openjdk-devel.x86_64
# sudo alternatives --config java
# sudo alternatives --config javac
sudo dnf install -y maven

#qbittorrent
sudo dnf install -y qbittorrent

# dconf-editor
sudo dnf install -y dconf-editor

# kolourpaint
sudo dnf install -y kolourpaint

# flameshot
sudo dnf install -y flameshot

# fzf
sudo dnf install -y fzf

# krita
sudo dnf install -y krita

# gnome tweaks
sudo dnf install -y gnome-tweaks

# timeshift
sudo dnf install -y timeshift

# inkscape
sudo dnf install -y inkscape

# gimp
sudo dnf install -y gimp

# gh
sudo dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo
sudo dnf install -y gh

# docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager \
    --add-repo \
    https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install -y docker-ce docker-ce-cli containerd.io
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo groupadd docker
sudo usermod -aG docker $USER

# code
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Stu  dio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install -y code

# Notion
sudo touch /etc/yum.repos.d/notion-repackaged.repo
echo "[notion-repackaged]
name=notion-repackaged
baseurl=https://yum.fury.io/notion-repackaged/
enabled=1
gpgcheck=0" | sudo tee /etc/yum.repos.d/notion-repackaged.repo -a
sudo dnf install -y notion-app

# bat
sudo dnf install -y bat

# exa
sudo dnf install -y exa

# chrome
sudo dnf config-manager --set-enabled google-chrome
sudo dnf install -y google-chrome-stable

# flatpacks
flatpak install flathub -y org.telegram.desktop
flatpak install flathub -y com.discordapp.Discord
flatpak install flathub -y rest.insomnia.Insomnia
flatpak install flathub -y io.github.Figma_Linux.figma_linux
