# Base16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-atelier-dune.sh
end

# Env Variables
set -x TERMINAL xfce4-terminal
set -x EDITOR nvim
set -x GRADLE_HOME $HOME/.sdkman/candidates/gradle/current

# Aliases
alias vim=nvim
alias conf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias nvconf='vim ~/.config/nvim/init.vim'
alias myd='vim ~/.i3/config'
alias fconf='vim ~/.config/fish/config.fish'
