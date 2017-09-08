# SUDO aliases
alias fucking='sudo'
alias pls='sudo'
alias fak='echo'

# Hosts file
alias hosts="sudo nano /etc/hosts"

# Quick navigation
alias ..="cd .."
alias ...="cd ../.."
alias .2="cd ../.."
alias .3="cd ../../../"
alias .4="cd ../../../../"
alias .5="cd ../../../../../"
alias .6="cd ../../../../../../"
alias b="cd -"
alias ls="ls -p"
alias ll="ls -lp"
alias la="ls -lAp"

function abs {
    perl -MCwd -e 'print Cwd::realpath($ARGV[0])' $1
}

function lna {
    opts=()
    i=1

    src_index=$[$# - 1];
    trgt_index=$[$#];

    src=${!src_index}
    trgt=${!trgt_index}

    for var in "$@"
    do
        if [[ $i != $src_index ]] && [[ $i != $trgt_index ]]; then
            opts+=("$var")
        fi
        i=$[$i + 1];
    done

    ln "${opts[@]}" "$(abs $src)" "$(abs $trgt)"
}

# Thefuck aliases
eval $(thefuck --alias)

# Quick open/edit
alias edit="open -a brackets"
function ce ()
{
    cd "$1" && edit ./
}
function mke ()
{
    mkdir "$1" && cd "$1" && edit ./
}

# Network
alias ip="curl icanhazip.com"
alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Quickly edit this file
alias profile="open -a brackets ~/.bash_profile"
alias r="source ~/.bash_profile"

# Finder
alias finder="open -a finder"
alias killfinder="killall Finder"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

