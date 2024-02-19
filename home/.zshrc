# deps:
# zplug
# git

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

# zplug plugins
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Source plugins and add commands to $PATH
zplug load --verbose


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
eval "$(zoxide init zsh)"
