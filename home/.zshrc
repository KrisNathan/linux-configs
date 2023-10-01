
case $TERM in
    xterm*)
        precmd () {print -Pn "\e]0;%n@%m: %~\a"}
        ;;
esac

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd beep notify

# vim keybindings
bindkey -v

zstyle :compinstall filename '/home/kris/.zshrc'

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
# zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# rust cargo
source "$HOME/.cargo/env"

# dotnet
export PATH="$PATH:$HOME/.dotnet/tools"
export PATH="$PATH:$HOME/Portable/omnisharp-linux-x64-net6.0"

# python and stuff
export PATH="$PATH:$HOME/.local/bin"

# nvm (node version manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# deno
export DENO_INSTALL="/home/kris/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

# bat replacement for cat
alias cat="bat"
alias ls="exa"
alias box="distrobox-enter --name fedora-38 -- zsh -l"
alias code="code --enable-features=WaylandWindowDecorations --ozone-platform-hint=auto"

eval "$(starship init zsh)"