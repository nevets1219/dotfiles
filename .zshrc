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

# Customize to your needs...
source $HOME/.aliases

autoload -Uz promptinit
promptinit
prompt sorin

source /usr/local/share/zsh/site-functions/_aws

# fpath=(/usr/local/share/zsh-completions $fpath)
fpath=($(brew --prefix)/share/zsh/site-functions $fpath)
fpath=($(brew --prefix)/share/zsh-completions $fpath)

source ~/.iterm2_shell_integration.zsh
