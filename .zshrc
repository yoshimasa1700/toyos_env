autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

autoload -U add-zsh-hook
# プロンプトの設定
nprom () {
    setopt prompt_subst
    local rbase=$'%{\e[33m%}[%~]%{\e[m%}' lf=$'\n'
    local pct=$'%0(?||%18(?||%{\e[31m%}))%#%{\e[m%}'
    RPROMPT="%9(~||$rbase)"
    case "$USER" in
      yatex)	PROMPT=$'%{\e[33m%}%U%m{%n}%%%{\e[m%}%u ' ;;
      java)	PROMPT=$'%{\e[36m%}%U%m{%n}%%%{\e[m%}%u ' ;;
      *)
    local pbase=$'%{\e[$[32+RANDOM%5]m%}%U%B%m{%n}%b'"$pct%u "
    PROMPT="%9(~|$rbase$lf|)$pbase"
    ;;
    esac
    [[ "$TERM" = "screen" ]] && RPROMPT="[%U%~%u]"
}
nprom

function powerline_precmd() {
    export PS1="$(~/toyos_env/powerline-shell/powerline.py $? --shell zsh 2> /dev/null)"
}
function install_powerline_precmd() {
    for s in "${precmd_functions[@]}" ; do
	if [ "$s" = "powerline_precmd" ] ; then
	    return
	fi
    done
    precmd_functions+=(powerline_precmd)
}
install_powerline_precmd

# コマンド履歴
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data

# コマンド履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# ディレクトリ名を入力するだけで移動
setopt auto_cd

# 移動したディレクトリを記録しておく。"cd -[Tab]"で移動履歴を一覧
setopt auto_pushd

# コマンド訂正
setopt correct

# 補完候補を詰めて表示する
setopt list_packed 

# 補完候補表示時などにピッピとビープ音をならないように設定
setopt nolistbeep

# Emacsライクキーバインド設定
bindkey -e 

# alias for git
alias gco="git checkout"
alias gst="git status"
alias gci="git commit -a"
alias gdi="git diff"
alias gbr="git branch"

show-current-dir-as-window-name() {
tmux set-window-option window-status-format " #I ${PWD:t} " > /dev/null
}

show-current-dir-as-window-name
add-zsh-hook chpwd show-current-dir-as-window-name

if [ -z "$TMUX" ]; then
	tmux
fi

#alias open="xdg-open"

if [ -f ~/.zshrc.local ] && source ~/.zshrc.local

