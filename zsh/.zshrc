export USER=""
# Path to your oh-my-zsh installation.
export ZSH="/Users/${USER}/.oh-my-zsh"

# theme
ZSH_THEME="robbyrussell"

. ~/.z.sh

# zsh plugins
plugins=(
  git
  z
  macos
  zsh-syntax-highlighting
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

RPROMPT='%{$fg_bold[blue]%} %T %D % %'

# aliases
## general
alias -g gr="grep"
alias sz="du -hs" # stands for size

alias pbc="pbcopy"
alias pbp="pbpaste"
alias l="exa --long --git"
alias ll="exa --long"
alias lla="exa -a --long"
alias cat="bat"
alias more="bat"
alias dk="docker"
alias dkimg="dk images"
alias dkcnt="dk container ls"
alias finder="ofd"
alias here="ofd"

alias prev="cd -"
alias npmg="npm ls -g --depth=0"
alias pn="pnpm"
alias hosts="cat /etc/hosts"
alias findpid="sudo lsof -i -P | grep"
alias e="exit"
alias w="webstorm"

## deno
alias dr="deno run"

## python
alias py="python3"

## nvim
alias nv="nvim"

## rbenv
alias r="/Users/${USER}/.rbenv/shims/ruby"
alias rbe="rbenv"
alias rbls="rbenv versions"

## tmux
alias tma="tmux attach -t $1"
alias tmd="tmux detach"
alias tmk="tmux kill-session -t $1"
alias tm="tmux"

## kubectl
alias k="kubectl"
alias kgp="k get pods"

## git
alias g="git"
alias gupd="git update"
alias gupdm="git updm"
alias gst="git status"
alias gsend="git pupu -f"
alias gdif="git diffmaster"
alias gdifm="git diffmain"
alias grei="git rebase -i origin/master"
alias gm="git cho master"
alias gmm="git cho main"
alias gb='git branch --sort=-committerdate | fzf --header Checkout | xargs git checkout'
# attempt-to-add: let to see git diff for untracked files
alias gdu='git add -N . && git diff'
alias gsta='git add . && git stash'
alias gunsta='git unstash && git reset .'

## gh
alias ghh="gh pr create --fill"
alias ghhd="gh pr create --fill -d"

## nvm
alias nvc="nvm current"

## git peek by Jarred Sumner
alias gp="git peek"

## alias for gitui
alias gi="gitui"

## ffmpeg
alias ff_convert="ffmpeg -i $1 -vf scale=1920:1080 -preset slow -crf 18 ./converted.mov"

## fe
alias scrpt="more package.json | gp '\"scripts\":' -A 13"

## npm
alias run="npm run"
alias start="npm start"

## pnpm
alias prun="pnpm run"
alias pstart="pnpm start"

## configs
alias zcon="nvim ~/.zshrc"
alias zupd="source ~/.zshrc"

alias nvcon="nvim ~/.config/nvim/init.vim"

alias gitcon="nvim ~/.gitconfig"

alias tcon="nvim ~/.tmux.conf"
alias tupd="tmux source ~/.tmux.conf"

# export NVM | autogenerated
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# NOTE: @gene, FIX this please
#     echo "node is 14.x"
#   else
#     echo "node is not 14.x"
# fi
# eval "nvm use default"


# configs
##nnn
export NNN_FIFO='/tmp/nnn.fifo'
# export NNN_PLUG='j:autojump;h:here;p:preview-tui'
# NOTE: temporarily disabled my custom `here`
export NNN_PLUG='j:autojump;g:gitroot;p:preview-tui'
export VISUAL=nvim
export EDITOR=nvim

function n {
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The behaviour is set to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, either remove the "export" as in:
    #    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #    (or, to a custom path: NNN_TMPFILE=/tmp/.lastd)
    # or, export NNN_TMPFILE after nnn invocation
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    #
    # # # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # # # stty start undef
    # # # stty stop undef
    # # # stty lwrap undef
    # # # stty lnext undef
    # #
    # # nnn "$@"
     TMUX='' tmux new-session nnn $@

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

## fzf config
## export of FZF stuff, related for cli history
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

FD_OPTIONS="--follow --exclude .git --exclude node_modules"

## ctrl-d:half-page-down,ctrl-u:half-page-up -- maybe one day you'll gonna need this
export FZF_DEFAULT_OPTS="--height 50% -1 --bind='ctrl-y:execute-silent(echo {+} | pbcopy)'"

## to use external "fd" tool
export FZF_DEFAULT_COMMAND="fd --type f --type l $FD_OPTIONS"
## stands for search files mode
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
## stands for go to mode
export FZF_ALT_C_COMMAND="fd --type d  $FD_OPTIONS"

## sessions configs EXAMPLE
alias liroo="ssh -i ~/.ssh/<ssh_key> <user>@<ip>"

# PATH
export PATH="/usr/local/opt/sqlite/bin:$PATH"

# NOTE: to make this work, please refer to your custom tmux/README.md
export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo

## export GO
export PATH="$PATH:/usr/local/go/bin"

## export the newest bash 5.x
## NOTE: if I'm not mistaken this was needed for some tmux update?!?
export PATH="$PATH:/usr/local/Cellar/bash/5.1.8/bin"

## export pip
export PATH="$PATH:/Users/${USER}/Library/Python/3.8/bin"

## deno
export DENO_INSTALL="/Users/${USER}/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

## rbenv
eval "$(rbenv init - zsh)"

# pnpm
export PNPM_HOME="/Users/${USER}/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"

# bun completions
[ -s "/Users/${USER}/.bun/_bun" ] && source "/Users/${USER}/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
