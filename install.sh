#!/usr/bin/env bash
set -e

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

symlink() {
  local src="$1"
  local dst="$2"
  mkdir -p "$(dirname "$dst")"
  if [ -e "$dst" ] && [ ! -L "$dst" ]; then
    echo "Backing up $dst -> $dst.bak"
    mv "$dst" "$dst.bak"
  fi
  ln -sf "$src" "$dst"
  echo "Linked $dst"
}

# Install packages if on Ubuntu and not already present
if command -v apt &>/dev/null; then
  if ! command -v nvim &>/dev/null; then
    echo "Installing neovim..."
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt update -y
    sudo apt install -y neovim
  fi

  if ! command -v tmux &>/dev/null; then
    echo "Installing tmux..."
    sudo apt install -y tmux
  fi
fi

if ! command -v starship &>/dev/null; then
  echo "Installing starship..."
  curl -sS https://starship.rs/install.sh | sh -s -- --yes
fi

# Switch default shell to bash if not already
if [ "$SHELL" != "$(which bash)" ]; then
  echo "Switching default shell to bash..."
  sudo chsh -s "$(which bash)" "$USER"
fi

# nvim
symlink "$DOTFILES/nvim" "$HOME/.config/nvim"

# starship
symlink "$DOTFILES/starship.toml" "$HOME/.config/starship.toml"

# tmux
symlink "$DOTFILES/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
symlink "$DOTFILES/tmux/keybinds-help.sh" "$HOME/.config/tmux/keybinds-help.sh"

# bash
symlink "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
symlink "$DOTFILES/bash/.bash_profile" "$HOME/.bash_profile"

echo "Done. Restart your shell."
