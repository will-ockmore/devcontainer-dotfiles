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

STATE_DIR=$HOME

[ -n "$WF_STATE_DIR" ] && STATE_DIR="$WF_STATE_DIR"
[ -n "$SB_STATE_DIR" ] && STATE_DIR="$SB_STATE_DIR"


# Set history to be persisted between `wfx up` runs
HISTFILE="$STATE_DIR/.zsh_history"

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

export DO_NOT_TRACK=1

# Add wf commands
[ -f /root/.sh_functions_wf ] && source /root/.sh_functions_wf

# Sync wf configuration
wf ide sync

# Add neovim location to PATH
export PATH=$PATH:$STATE_DIR/neovim/bin

# fzf key bindings
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --glob '!.git/*' --glob '!*node_modules*' --glob '!*venv*'"
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
