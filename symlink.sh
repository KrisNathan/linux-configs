# trollge...
DIR="$( cd "$( dirname "$0" )" && pwd )"

echo $DIR

ln -s $DIR/dotconfig/alacritty ~/.config/alacritty
ln -s $DIR/dotconfig/i3 ~/.config/i3
ln -s $DIR/dotconfig/i3status ~/.config/i3status
ln -s $DIR/dotconfig/sway ~/.config/sway

# idk about helix
ln -s $DIR/dotconfig/helix/config.toml ~/.config/helix/config.toml
ln -s $DIR/dotconfig/helix/language.toml ~/.config/helix/language.toml

ln -s $DIR/home/.zshrc ~/.zshrc
ln -s $DIR/home/.profile ~/.profile
ln -s $DIR/home/.gitconfig ~/.gitconfig