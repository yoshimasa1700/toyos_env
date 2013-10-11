#alias emacs='open -a emacs'
export PATH=$PATH:/Users/masahiko/Qt5.0.2/5.0.2/clang_64/bin
export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export HOMEBREW_CC="llvm"
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin
export OPENNI2_INCLUDE=/Users/masahiko/Library/openni/OpenNI-2.1.0/Include
export OPENNI2_REDIST=/Users/masahiko/Library/openni/OpenNI-2.1.0/Redist
#export PYTHONSTARTUP=$PYTHONSTARTUP:$HOME/.pythonrc.py python

autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z} r:|[-_.]=**'

# プロンプトの設定
nprom () {
    setopt prompt_subst
    local rbase=$'%{\e[33m%}[%%{\e[m%}' lf=$'\n'
    local pct=$'%0(?||%18(?||%{\e[31m%}))%#%{\e[m%}'
    RPROMPT="%9(~||$rbase)"
    case "$USER" in
	yatex)PROMPT=$'%{\e[33m%}%U%m{%n}%%%{\e[m%}%u ' ;;
	java)PROMPT=$'%{\e[36m%}%U%m{%n}%%%{\e[m%}%u ' ;;
      *)
    local pbase=$'%{\e[$[32+RANDOM%5]m%}%U%B%m{%n}%b'"$pct%u "
    PROMPT="%9(~|$rbase$lf|)$pbase"
    ;;
    esac
    [[ "$TERM" = "screen" ]] && RPROMPT="[%U%~%u]"
}
nprom

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


alias gco="git checkout"
alias gst="git status"
alias gci="git commit -a"
alias gdi="git diff"
alias gbr="git branch"
if [ -z "$TMUX" ]; then
	tmux
fi

alias emacs='/Users/masahiko/Programs/emacs/emacs/nextstep/Emacs.app/Contents/MacOS/Emacs -nw'
