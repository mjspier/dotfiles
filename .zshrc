# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/mspieren/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Manuel Spierenburg configured
# open new terminal in same directory
precmd() { eval "$PROMPT_COMMAND" }
PROMPT_COMMAND='pwd > "${HOME}/.cwd"'
[[ -f "${HOME}/.cwd" ]] && cd "$(< ${HOME}/.cwd)"
#
# start python virtualenv
source ~/.fkps/bin/activate

#source ~/.zsh/colors.zsh
source ~/.zsh/exports.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/prompt.zsh
