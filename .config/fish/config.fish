# Base16 Shell
if status --is-interactive
    eval sh $HOME/.config/base16-shell/scripts/base16-atelier-dune.sh
end

# Spacefish
set SPACEFISH_DOCKER_SYMBOL ' '

# Env Variables
set -x TERMINAL xfce4-terminal
set -x EDITOR nvim
set -x GRADLE_HOME $HOME/.sdkman/candidates/gradle/current

set -x MINIKUBE_WANTUPDATENOTIFICATION false
set -x MINIKUBE_WANTREPORTERRORPROMPT false
set -x MINIKUBE_HOME $HOME
set -x CHANGE_MINIKUBE_NONE_USER true
set -x KUBECONFIG $HOME/.kube/config

set -x THREAD_WORKER 3
set -x TS_WORKER 2
set -x TS_MEMORY 1536
set -x FOCE_COLOR 1

# set -x PET_PUB_KEY ~/.petclinic/certs.json
set -x -U GOPATH $HOME/dev/workspaces/go

# Aliases
alias vim=nvim
alias conf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias nvconf='vim ~/.config/nvim/init.vim'
alias myd='vim ~/.config/i3/config'
alias fconf='vim ~/.config/fish/config.fish'
