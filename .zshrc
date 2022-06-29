# environment setup
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/home/natalia/.local/bin
export PATH="$PATH:/opt/mssql-tools/bin"

## poetry
export PATH=$PATH:$HOME/.poetry/bin
## nvm
which /usr/share/nvm/init-nvm.sh >/dev/null 2>&1 && source /usr/share/nvm/init-nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 180

plugins=(git
         gitfast
         sudo
         copypath
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
which yay >/dev/null 2>&1 && alias yayi="yay -S"
which yay >/dev/null 2>&1 && alias yayu="yay -Syu"

## general
alias zshconfig="subl ~/.zshrc"
alias python=python3
alias py="python"
alias clone="gh repo clone"
alias dc="docker compose"
alias minifycss="npx cleancss -o style.min.css style.css --with-rebase"
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
alias cloudserver="ssh natalia@cloud.wwwsnow.org"

## docker images
alias dprune="docker system prune --all --volumes"
alias postgres="docker compose -f ~/.local/bin/postgres.yaml"
alias mysql="docker compose -f ~/.local/bin/mysql.yaml"
alias sqlserver="docker compose -f ~/.local/bin/sqlserver.yaml"
alias mongo="docker compose -f  ~/.local/bin/mongo.yaml"
alias redis="docker compose -f  ~/.local/bin/redis.yaml"

# docker exec
function dsh() {
  docker exec -it $1 sh
}