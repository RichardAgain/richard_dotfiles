# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias pa='php artisan'

SSH_ENV="$HOME/.ssh-agent.env"

if [ -z "$SSH_AUTH_SOCK" ]; then
  if [ -f "$SSH_ENV" ]; then
    source "$SSH_ENV" > /dev/null
  fi

  # if still no ssh-agent, start a new one
  if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)" > /dev/null
    echo "export SSH_AUTH_SOCK=$SSH_AUTH_SOCK" > "$SSH_ENV"
    echo "export SSH_AGENT_PID=$SSH_AGENT_PID" > "$SSH_ENV"
    chmod 600 "$SSH_ENV"
    # Add keys
    ssh-add ~/.ssh/github 2>/dev/null
  fi
fi

export PATH="$HOME/.config/composer/vendor/bin:$PATH"
export PATH="$HOME/projects/llama.cpp/build/bin/":$PATH

. "$HOME/.local/share/../bin/env"

# opencode
export PATH=/home/richardo/.opencode/bin:$PATH
