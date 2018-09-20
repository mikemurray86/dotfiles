#  <---Setup--->
autoload -Uz compinit promptinit
compinit
promptinit

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
setopt COMPLETE_ALIASES

autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey -v

[[ -n "$key[Up]"   ]] && bindkey -- "$key[Up]"   up-line-or-beginning-search
[[ -n "$key[Down]" ]] && bindkey -- "$key[Down]" down-line-or-beginning-search

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

# <---Variables--->
export EDITOR=/usr/bin/vim

if [ -d "$HOME/.oh-my-zsh" ]; then
    export ZSH="/home/mike/.oh-my-zsh"
    ZSH_THEME="af-magic"

    plugins=(
      git
    )

    source $ZSH/oh-my-zsh.sh
else
    # <---Color Mapping--->
    red='%F{red}'
    blue='%F{blue}'
    PROMPT="$blue%\[%f%n$blue%\]%f %~ %(!.#.$) %f "
fi

# <---Functions--->

# <---Alias--->
alias vi='vim'
alias ls='ls --color=auto'
