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

# nvim
symlink "$DOTFILES/nvim" "$HOME/.config/nvim"

# tmux
symlink "$DOTFILES/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"
symlink "$DOTFILES/tmux/keybinds-help.sh" "$HOME/.config/tmux/keybinds-help.sh"

# bash
symlink "$DOTFILES/bash/.bashrc" "$HOME/.bashrc"
symlink "$DOTFILES/bash/.bash_profile" "$HOME/.bash_profile"

echo "Done."
