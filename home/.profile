. "$HOME/.cargo/env"

if [[ $DESKTOP_SESSION=~"^i3.*$" ]]; then
  #export DESKTOP_SESSION="gnome"
  export DESKTOP_SESSION="kde"
  export XDG_CURRENT_DESKTOP="KDE" 
fi

export PATH=~/.npm-global/bin:$PATH