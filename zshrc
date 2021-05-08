export ZSH="/home/dan/.oh-my-zsh"

ZSH_THEME="eastwood"

DISABLE_AUTO_UPDATE="true"
DISABLE_AUTO_TITLE="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
  git
  python
  zsh-autosuggestions # https://github.com/zsh-users/zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

source ~/.zplug/init.zsh

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

zplug load

alias fig="docker-compose"
alias rm="rm -i"
alias vi="vim"
alias py="python"
alias ipy="ipython"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

source /home/dan/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
