# environment setup
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/home/natalia/.local/bin

## asdf
source /opt/asdf-vm/asdf.sh

## poetry
export PATH=$PATH:$HOME/.poetry/bin

# java
. ~/.asdf/plugins/java/set-java-home.zsh

## react native
export ANDROID_HOME=~/.android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 180

plugins=(git
         gitfast
         sudo
         copypath
         dotenv
         zsh-interactive-cd
         zsh-z
         zsh-autosuggestions
         zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


# aliases and function
## shell functions
alias refresh="exec /bin/zsh"
alias clr="clear"
alias copydir="copypath"
alias open="nemo"

## dotfiles git management
alias gdot="git --git-dir=.dot"
alias updots="gdot pull; gdot add -u; gdot commit -m 'update dotfiles'; gdot push"

## dnf/apt/yay
which dnf >/dev/null 2>&1 && alias dnfi="sudo dnf install -y"
which dnf >/dev/null 2>&1 && alias dnfu="sudo dnf update"
which apt >/dev/null 2>&1 && alias apti="sudo apt install -yf"
which apt >/dev/null 2>&1 && alias aptu="sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y"
which yay >/dev/null 2>&1 && alias yayi="yay -Syu --noconfirm"

## general
alias py="python"
alias clone="gh repo clone"
alias dc="docker-compose"
alias minifycss="cleancss -o style.min.css style.css --with-rebase"
alias dotenv="dotenv-cli"
alias create-next="yarn create next-app -e https://github.com/nataliafonseca/boilerplate_nextjs"
alias mirage-start="degit nataliafonseca/miragejs-starter-kit miragejs"
alias mkvenv="python -m venv ./venv"
alias venv="source ./venv/bin/activate"
alias poetryrm="rm -rf $(poetry env info -p)"
alias ytdl="youtube-dl -o '~/Videos/%(title)s-%(id)s.%(ext)s'"

## exa
which exa >/dev/null 2>&1 && alias ls="exa -lh --icons --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa >/dev/null 2>&1 && alias la="exa -lha --icons --time-style=long-iso --group-directories-first --sort=name --sort=ext"
which exa >/dev/null 2>&1 && alias tree="exa --icons --tree"

## ssh connection to servers
alias homelab="ssh natalia@192.168.0.10"
alias cloudserver="ssh natalia@static.151.42.161.5.clients.your-server.de"

## docker images
alias dprune="docker system prune --all --volumes"
alias postgres="docker-compose -f postgres.yaml"
alias mongo="docker-compose -f mongo.yaml"
alias redis="docker-compose -f redis.yaml"

# npm audit fix for yarn projects
function yarn-audit-fix() {
  npm i --package-lock-only
  npm audit fix
  rm yarn.lock
  yarn import
  rm package-lock.json
}
