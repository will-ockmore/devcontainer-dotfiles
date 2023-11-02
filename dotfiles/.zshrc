# Enable extended globbing eg. negation patterns
setopt extended_glob

# don't require explicitly matching a leading . in filenames
setopt glob_dots

# Save history from concurrent sessions
setopt inc_append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_space
HISTSIZE=100000000
SAVEHIST=100000000

# Set history to be persisted between `wfx up` runs
HISTFILE="$WF_STATE_DIR/.zsh_history"

# Custom configuration
# All commands and aliases are stored separately in the .dotfiles folder

# pure prompt
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

source ~/.dotfiles/aliases.sh
source ~/.dotfiles/misc-commands.sh

export GPG_TTY=$(tty)

alias vi='nvim'
alias vim='nvim'

export EDITOR='nvim'
export VISUAL=$EDITOR
export GIT_EDITOR=$EDITOR

# Add neovim location to PATH
export PATH=$PATH:$WF_STATE_DIR/neovim/bin


if [[ ! -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
  sudo curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/completion.zsh -o /usr/share/doc/fzf/examples/completion.zsh
  sudo curl https://raw.githubusercontent.com/junegunn/fzf/master/shell/key-bindings.zsh -o /usr/share/doc/fzf/examples/key-bindings.zsh
fi

[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ] && source /usr/share/doc/fzf/examples/key-bindings.zsh
[ -f /usr/share/bash-completion/completions/fzf ] && source /usr/share/bash-completion/completions/fzf

export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob '!.git/*' --glob '!*node_modules*' --glob '!*venv*'"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND

