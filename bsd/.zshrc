#
export PATH=$PATH:$HOME/bin

setopt prompt_subst

git_prompt_info() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    print "|%{\e[38;5;197m%}${ref#refs/heads/}%{\e[0m%}"
}

export PROMPT="$(print '%{\e[1;37m%}[%/$(git_prompt_info)] -%n- ')\
$(print '%1(j.%{\e[38;5;185m%}|%j|%{\e[1;37m%}.)')\
$(print '%{\e[38;5;22m%}>')\
$(print '%{\e[38;5;34m%}>')\
$(print '%{\e[38;5;46m%}>')\
$(print '%{\e[0m%}') "
#$(print '%{\e[38;5;16m%}>')\
#$(print '%{\e[38;5;28m%}>')\
#$(print '%{\e[38;5;40m%}>')\

export PROMPT2="$(print '%{\e[1;37m%}[%/$(git_prompt_info)] -%n- ')\
$(print '%1(j.%{\e[38;5;185m%}|%j|%{\e[1;37m%}.)')\
$(print '%{\e[38;5;22m%}>')\
$(print '%{\e[38;5;28m%}>')\
$(print '%{\e[38;5;34m%}>')\
$(print '%{\e[0m%}') %_ \
$(print '%{\e[38;5;34m%}>')\
$(print '%{\e[38;5;40m%}>')\
$(print '%{\e[38;5;46m%}>')\
$(print '%{\e[0m%}') "

export RPROMPT="$(print '[%(?.%{\e[1;37m%}%T%{\e[0m%}. %{\e[38;5;203m%}%?%{\e[0m%} )]')"
#export RPROMPT="$(print '[ %{\e[1;37m%}%(?.%T.%?)%{\e[0m%} ]')"
#export RPROMPT=$'%(?..[ %B%?%b ])'

export LC_ALL=zh_TW.UTF-8
export LANG=$LC_ALL
export EDITOR="vim"
export GREP_OPTIONS='--color=auto'
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=~/.history
export LSCOLORS=ExFxCxdxBxegedabagacad

setopt correctall
setopt append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt no_hist_beep
setopt hist_save_no_dups
setopt noflowcontrol                  #no flow control enable keybind for ^Q

autoload -U compinit
compinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' list-colors $LSCOLORS
#zstyle ':completion:*' special-dirs ..

zle_highlight=(region:bg=magenta special:bold isearch:underline)

#bindkey -v                               # vi mode
bindkey -e                               # emacs mode
bindkey "\e[1~" beginning-of-line        # Home
bindkey "\e[7~" beginning-of-line        # Home rxvt
bindkey "\e[2~" overwrite-mode           # Ins
bindkey "\e[3~" delete-char              # Delete
bindkey "\e[4~" end-of-line              # End
bindkey "\e[8~" end-of-line              # End rxvt
bindkey "\e[5~" history-search-backward  # PageUp
bindkey "\e[6~" history-search-forward   # PageDown
bindkey "^Q" push-line
bindkey "^G" get-line
bindkey "^Z" undo
bindkey "^Y" vi-undo-change

alias vim="vim -p"
alias df="df -h"
alias ls="ls -Gw"
alias ll="ls -al"
alias l="ls -a"
alias cls="clear"
alias g='grep'
alias :q='exit'
alias :qa='exit'
alias :Q='exit'
alias :Qa='exit'
alias ~="cd ~"
alias ..="cd .."
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../../..'
alias -g ......='../../../../../..'
alias -g .......='../../../../../../..'

