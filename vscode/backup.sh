set -ex;
cd ~/_dotfiles/vscode
cp ~/Library/Application\ Support/Code/User/keybindings.json artifacts/
cp ~/Library/Application\ Support/Code/User/settings.json artifacts/
code --list-extensions | xargs -L 1 echo code --install-extension >> artifacts/restore-vscode-extensions.sh