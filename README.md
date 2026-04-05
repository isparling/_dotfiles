# dotfiles

My dotfiles for setting up a new macOS machine.

## What's Included

- **Shell**: zsh, bash configs (zshrc, zshenv, bashrc, gitconfig, vimrc)
- **Node**: npmrc, pnpmrc
- **VS Code**: settings, keybindings, 54 extensions
- **Ghostty**: terminal config
- **Rectangle Pro**: window management config
- **SSH**: config template

## Installation

```zsh
cd ~
git clone git@github.com:isparling/_dotfiles.git ~/_
cd _dotfiles
./install.sh
```

Options:
- `./install.sh --skip-brew` - Skip Homebrew bundle install

## Manual Steps After Install

1. Restart shell
2. Add secrets to `~/.secrets.env` or uncomment vault paths in config/zshrc
3. Set up SSH config from template: `cp ssh/config.template ~/.ssh/config`
4. Configure Rectangle Pro: import `rectangle-pro/config.json`

## Manual Steps (Not Tracked)

- Alfred preferences
- BetterTouchTool presets
- SSH keys (keep in `~/.ssh/`, add to 1Password)
