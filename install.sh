#!/bin/zsh
mv ~/.zshrc ~/.zshrc.bk
echo "Original .zshrc backed up to ~/.zshrc.bk"
brew bundle
echo "bundle installed"

cp .zshrc ~/.zshrc
echo ".zshrc copied to ~/.zshrc"
cp .git-prompt.sh ~/.git-prompt.sh
echo ".git-prompt.sh copied to ~/.git-prompt.sh"
cp emoji.sh /usr/local/bin/emoji
echo "random emoji script installed at [/usr/local/bin/emoji]"
cp .gitconfig ~/.gitconfig
echo ".gitconfig copied to ~/.gitconfig"
cp .vimrc ~/.vimrc
echo ".vimrc copied to ~/.vimrc"

echo "Please restart your shell"