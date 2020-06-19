# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# global history
set INC_APPEND_HISTORY
unsetopt beep
bindkey -e
setopt noflowcontrol
# global history
setopt INC_APPEND_HISTORY
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
precmd() { eval "$PROMPT_COMMAND" ; echo "$PWD" > ~/.cwd }
PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOST}:${PWD}\007"'

#source ~/.zsh/colors.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/functions.zsh


# activate virtualenv 
function chpwd() {
    echo "$PWD" > ${HOME}/.cwd
    if [ -z "$VIRTUAL_ENV" ] ; then
        if [ -f ".venv" ] ; then
            VENV=$(cat .venv)
            echo "activate global virtualenv ${VENV}"
            source "${HOME}/.venvs/${VENV}/bin/activate"
            # source  $(cat .venv)
        elif [ -d ".venv" ] ; then
            echo "activate virtualenv"
            source .venv/bin/activate
        fi
    fi
    # elif [ -f "Pipfile" ] ; then
    #     # check if not activated yet
    #     if [ -z "$VIRTUAL_ENV" ] ; then
    #         precmd()
    #         pipenv shell
    #     fi
    # fi
}

