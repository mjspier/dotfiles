# alias egrep='egrep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias grep='grep --color=auto'
 alias ls='ls -G'
# alias ll='ls -1'
alias cat_json='python -m json.tool'
# alias nautilus="nautilus --no-desktop"
#
alias kctx="kubectx"
alias kns="kubens"
alias kctl="kubectl"

alias pip_update="pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U"
