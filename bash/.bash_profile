export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
alias ls='ls -GFh'
ulimit -n 65536
ulimit -u 2048
ulimit -n 65536
ulimit -u 2048

# The next line updates PATH for the Google Cloud SDK.
source '/Users/benjongbloedt/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
source '/Users/benjongbloedt/google-cloud-sdk/completion.bash.inc'

export NVM_DIR="/Users/benjongbloedt/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
