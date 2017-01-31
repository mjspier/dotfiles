# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
setopt noflowcontrol
stty -ixon
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mspieren/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Manuel Spierenburg configured
# open new terminal in same directory
[[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"
# set terminal title
precmd() { eval "$PROMPT_COMMAND" }
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOST}:${PWD}\007"'
# start python virtualenv

#source ~/.zsh/colors.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/prompt.zsh
source ~/.local/bin/virtualenvwrapper.sh

# activate kps virtual env when in kps dir
function chpwd() {
    echo "$PWD" > ${HOME}/.cwd
    if [[ $PWD == /home/mspieren/Development/kps/* ]] ; then
        if [[ $VIRTUAL_ENV != kps ]] ; then
            echo "activate virtual env (kps)"
            workon kps
        fi
    fi
}
