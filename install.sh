#!/bin/zsh
mv ~/.zshrc ~/.zshrc.bk
echo "Original .zshrc backed up to ~/.zshrc.bk"

cp .zshrc ~/.zshrc
echo ".zshrc copied to ~/.zshrc"
cp .git-prompt.sh ~/.git-prompt.sh
echo ".git-prompt.sh copied to ~/.git-prompt.sh"

echo "Please restart your shell"