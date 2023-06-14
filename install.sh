#!/bin/zsh
brew bundle
echo "bundle installed"

echo "Cloning git-prompt"
if [ ! -d "lib/git-prompt.zsh" ]; then 
  git clone git@github.com:woefe/git-prompt.zsh.git lib/git-prompt.zsh
  echo "  woefe/git-prompt.zsh.git cloned to lib/"
fi

if [ -d lib/git-prompt.zsh ]; then
  echo "  woefe/git-prompt.zsh.git already cloned"
fi

for CONFIG in $(ls config/)
do
  echo "Linking [$(pwd)/$config] to ~/.$CONFIG"
  if [ ! "~/.$CONFIG" ]; then
    ln -s "$(pwd)/config/$CONFIG" ~/.$CONFIG
    echo "  $(pwd)/$config linked to ~/.$CONFIG"
  fi
  if [ "~/.$CONFIG" ]; then
    echo "  $(pwd)/$config already linked. Skipping."
  fi
done

echo "Installing emoji script"
if [  "/usr/local/bin/emoji" ]; then
  ln emoji.sh /usr/local/bin/emoji
  echo "  emoji script installed via hardlink at [/usr/local/bin/emoji]"
fi
if [ ! "/usr/local/bin/emoji" ]; then
  echo "  emoji script already installed. Skipping."
fi

echo "Please restart your shell"