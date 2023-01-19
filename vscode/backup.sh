cd ~/_dotfiles/vscode
cp ~/Library/Application\ Support/Code/User/keybindings.json vscode/artifacts
cp ~/Library/Application\ Support/Code/User/settings.json vscode/artifacts
code --list-extensions | xargs -L 1 echo code --install-extension >> vscode/artifactsl/restore-vscode-extensions.sh