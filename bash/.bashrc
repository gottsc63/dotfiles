# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
[ -f ~/.local/share/omarchy/default/bash/rc ] && source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias l='eza -lh --group-directories-first --icons=auto'
alias ll='eza -lah --group-directories-first --icons=auto'
alias la='eza -lah --group-directories-first --icons=auto'
alias monitors='~/.config/hypr/monitors-switch.sh'

# Launch tmux "jigglez" session: bash (left 70%) + opencode (right 30%)
tmux-jigglez() {
  if tmux has-session -t jigglez 2>/dev/null; then
    tmux attach-session -t jigglez
  else
    tmux new-session -s jigglez -n jigglez -c "$HOME" \; \
      split-window -h -l 30% -c "$HOME" opencode \; \
      select-pane -t 0
  fi
}
export PATH="$HOME/.local/bin:$PATH"
export OPENCODE_ENABLE_EXA=1

# Starship prompt (must be after Omarchy to override their prompt)
eval "$(starship init bash)"
