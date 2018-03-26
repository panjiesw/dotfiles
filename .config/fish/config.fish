# Env Variables
set -x TERMINAL xfce4-terminal
set -x EDITOR nvim
set -x GRADLE_HOME $HOME/.sdkman/candidates/gradle/current

# Aliases
alias vim=nvim
alias conf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias myd='vim ~/.i3/config'
