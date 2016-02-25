# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git brew bundler gem git-flow pow powder)

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# alias
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

alias e="emacs"
alias gu="gst; ga .; gcmsg 'update'"

# for something
export EDITOR="emacs"

# rbenv
export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# for peco-select-history
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
                    eval $tac | \
                    peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# for peco-alias
function peco-alias(){
    TARGET_ALIAS=$(alias | peco --query "$LBUFFER")
    BUFFER=$(echo "$TARGET_ALIAS"|awk -F '=' '{print $1}')
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-alias
bindkey '^@^a' peco-alias
