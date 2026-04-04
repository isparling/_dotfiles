#!/bin/zsh

set -e

DOTFILES_DIR="$HOME/_dotfiles"

# Parse args
SKIP_BREW=false
while [[ $# -gt 0 ]]; do
    case $1 in
        --skip-brew) SKIP_BREW=true ;;
        *) echo "Unknown option: $1" ;;
    esac
    shift
done

echo "==> Installing dotfiles..."

# Homebrew (optional, can skip with --skip-brew)
if [ "$SKIP_BREW" = false ] && command -v brew &>/dev/null; then
    echo "==> Running brew bundle..."
    brew bundle
else
    echo "==> Skipping brew bundle (use --skip-brew to skip)"
fi

# Clone git-prompt.zsh if not present
if [ ! -d "$DOTFILES_DIR/lib/git-prompt.zsh" ]; then
    echo "==> Cloning git-prompt.zsh..."
    git clone https://github.com/woefe/git-prompt.zsh.git "$DOTFILES_DIR/lib/git-prompt.zsh"
fi

# Clone flexoki if not present
if [ ! -d "$DOTFILES_DIR/lib/flexoki" ]; then
    echo "==> Cloning flexoki..."
    git clone https://github.com/kepano/flexoki.git "$DOTFILES_DIR/lib/flexoki"
fi

# Create symlinks for shell configs
echo "==> Creating shell config symlinks..."
for config in zshrc zshenv bashrc gitconfig vimrc npmrc; do
    if [ -f "$DOTFILES_DIR/config/$config" ]; then
        if [ -L "$HOME/.$config" ]; then
            echo "  .$config already linked"
        else
            ln -sf "$DOTFILES_DIR/config/$config" "$HOME/.$config"
            echo "  Linked .$config"
        fi
    fi
done

# Ghostty config
echo "==> Setting up Ghostty..."
mkdir -p "$HOME/Library/Application Support/com.ghostty.config"
ln -sf "$DOTFILES_DIR/ghostty/config" "$HOME/Library/Application Support/com.ghostty.config/config"

# VSCode settings
echo "==> Setting up VSCode..."
mkdir -p "$HOME/Library/Application Support/Code/User"
[ -f "$DOTFILES_DIR/vscode/settings.json" ] && ln -sf "$DOTFILES_DIR/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
[ -f "$DOTFILES_DIR/vscode/keybindings.json" ] && ln -sf "$DOTFILES_DIR/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"

# VSCode extensions
if [ -f "$DOTFILES_DIR/vscode/extensions.list" ]; then
    echo "==> Installing VSCode extensions..."
    while IFS= read -r ext; do
        [ -n "$ext" ] && code --install-extension "$ext" --force 2>/dev/null &
    done < "$DOTFILES_DIR/vscode/extensions.list"
    wait
fi

# Rectangle Pro
if [ -f "$DOTFILES_DIR/rectangle-pro/config.json" ]; then
    echo "==> Setting up Rectangle Pro..."
    mkdir -p "$HOME/Library/Application Support/Rectangle Pro"
    ln -sf "$DOTFILES_DIR/rectangle-pro/config.json" "$HOME/Library/Application Support/Rectangle Pro/config.json"
fi

# SSH config template
if [ -f "$DOTFILES_DIR/ssh/config.template" ] && [ ! -f "$HOME/.ssh/config" ]; then
    echo "==> Setting up SSH config..."
    mkdir -p "$HOME/.ssh"
    cp "$DOTFILES_DIR/ssh/config.template" "$HOME/.ssh/config"
    chmod 600 "$HOME/.ssh/config"
fi

echo ""
echo "==> Dotfiles installation complete!"
echo ""
echo "Next steps:"
echo "  1. Restart your shell"
echo "  2. Update secrets in config/zshrc (1Password vault paths)"
echo "  3. Set up SSH config from template if needed"
echo "  4. Create ~/.secrets.env for any sensitive env vars"
