#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# yadr
for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# alias
alias vscode="open -a Visual\ Studio\ Code"
alias firefox="open -a Firefox"
alias divvy="Divvy"
alias nightowl="open -a Night\ Owl"
alias slack="open -a Slack"

# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}

zle -N peco-history-selection
bindkey '^R' peco-history-selection

# lang
export LANG=ja_JP.UTF-8

# the fuck
eval "$(thefuck --alias)"

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# mpdenv
export PATH="$HOME/.nodenv/bin:$PATH"
eval "$(nodenv init -)"
