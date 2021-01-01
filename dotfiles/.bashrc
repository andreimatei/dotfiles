if [ -t 1 ]
then
  bind '"\e[A":history-search-backward'
  bind '"\e[B":history-search-forward'
fi

alias g="git"
alias gca="git commit -a -m"
alias gco="git checkout"
alias grm="git rebase -i master"
alias gc="git commit"
alias gd="git diff"

# Use MacVim for vim.
# alias vim="mvim -v"


# History settings
shopt -s histappend
HISTFILESIZE=1000000
HISTSIZE=1000000
HISTCONTROL=ignoredups
HISTIGNORE='ls:bg:fg:history'
HISTTIMEFORMAT='%F %T '
shopt -s cmdhist
PROMPT_COMMAND='history -a'
HISTFILE=~/.bash_history

source ~/Dropbox/workstation\ backup/scripts/git-completion.sh

#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# The next line updates PATH for the Google Cloud SDK.
source '/Users/andrei/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/andrei/google-cloud-sdk/completion.bash.inc'


export GOOGLE_CREDENTIALS=$(cat ~/Dropbox/workstation\ backup/scripts/cockroach-andrei-d6adabdd6395.json)
export GOOGLE_PROJECT="cockroach-andrei"

#export GOPATH=/home/andrei/work
export PATH=$PATH:/home/andrei/work/src/github.com/golang/go/bin:/home/andrei/work/bin:/Users/andrei/scripts

# source $(brew --prefix autoenv)/activate.sh

source ~/work/src/github.com/nojhan/liquidprompt/liquidprompt  
# Put ccache in the path so that rocksdb compilation across versions is accelerated.
export PATH=/usr/bin/ccache:/usr/lib/ccache:$PATH

export EDITOR=vim

# Otherwise I get linker warnings when linking rocksdb with cockroach. Tamir knows.
export MACOSX_DEPLOYMENT_TARGET=10.13

export COCKROACH_DEV_LICENSE='crl-0-EJL04ukFGAEiI0NvY2tyb2FjaCBMYWJzIC0gUHJvZHVjdGlvbiBUZXN0aW5n'

# Get bash completion for roachprod.
source ~/.roachprod/bash-completion.sh

# direnv per-dir GOPATH
eval "$(direnv hook bash)"
alias config='/usr/bin/git --git-dir=/home/andrei/.cfg/ --work-tree=/home/andrei'
