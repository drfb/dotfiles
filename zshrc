export ZSH=/home/dan/.oh-my-zsh

ZSH_THEME="eastwood"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git,
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias fig="docker-compose"
alias rm="rm -i"
alias ngrok="~/ngrok"
