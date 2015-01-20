# function git_prompt_info {
#   local ref=$(=git symbolic-ref HEAD 2> /dev/null)
#   local gitst="$(=git status 2> /dev/null)"
#   local pairname=${${${GIT_AUTHOR_EMAIL#pair+}%@github.com}//+/\/}
#   if [[ ${pairname} == 'ch' || ${pairname} == '' ]]; then
#     pairname=''
#   else
#     pairname=" ($pairname)"
#   fi
#
#   if [[ -f .git/MERGE_HEAD ]]; then
#     if [[ ${gitst} =~ "unmerged" ]]; then
#       gitstatus=" %{$fg[red]%}unmerged%{$reset_color%}"
#     else
#       gitstatus=" %{$fg[green]%}merged%{$reset_color%}"
#     fi
#   elif [[ ${gitst} =~ "Changes to be committed" ]]; then
#     gitstatus=" %{$fg[blue]%}!%{$reset_color%}"
#   elif [[ ${gitst} =~ "use \"git add" ]]; then
#     gitstatus=" %{$fg[red]%}!%{$reset_color%}"
#   elif [[ -n `git checkout HEAD 2> /dev/null | grep ahead` ]]; then
#     gitstatus=" %{$fg[yellow]%}*%{$reset_color%}"
#   else
#     gitstatus=''
#   fi
#
#   if [[ -n $ref ]]; then
#     echo "%{$fg_bold[green]%}/${ref#refs/heads/}%{$reset_color%}$gitstatus$pairname"
#   fi
# }

#PROMPT='%~%<< $(git_prompt_info)${PR_BOLD_WHITE}>%{${reset_color}%} '
git_prompt() {
    ref=$(git symbolic-ref HEAD | cut -d'/' -f3)
    echo $ref
}

autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git cvs svn

# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
    vcs_info
    if [ -n "$vcs_info_msg_0_" ]; then
        echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
    fi
}

setopt PROMPT_SUBST
PROMPT='%{$(pwd|grep --color=always /)%${#PWD}G%} $(vcs_info_wrapper)%(!.%F{red}.%F{cyan})%n%f@%F{yellow}%m%f%(!.%F{red}.)%#%f '
