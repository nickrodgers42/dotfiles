# Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Download Znap, if it's not there yet.
[[ -f ~/Git/zsh-snap/znap.zsh ]] ||
    git clone --depth 1 -- \
        https://github.com/marlonrichert/zsh-snap.git ~/Git/zsh-snap

source ~/Git/zsh-snap/znap.zsh  # Start Znap

source ~/.path

export ZSH="$HOME/.oh-my-zsh"

unsetopt extended_glob
export VISUAL=nvim
export EDITOR="$VISUAL"

export aws_cli_auto_prompt=on-partial
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

ZSH_THEME="powerlevel10k/powerlevel10k"

# OhMyZsh Options

# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# DISABLE_UPDATE_PROMPT="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

znap source ohmyzsh/ohmyzsh

# OhMyZsh Plugins
plugins=(git aws)
source $ZSH/oh-my-zsh.sh

# Znap plugins
znap source zsh-users/zsh-syntax-highlighting

# User configuration
set -o vi
bindkey '^P' up-line-or-search
bindkey '^N' down-line-or-search

source ~/.alias
source ~/.functions

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

complete -C '/usr/local/bin/aws_completer' aws

export PATH="$HOME/bin:$PATH"

export JAVA_TOOLS_OPTIONS="-Dlog4j2.formatMsgNoLookups=true"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
