# System
alias allapps='sudo spctl --master-disable'

# SUDO aliases
alias fucking='sudo'
alias pls='sudo'
alias fak='sudo'

# Hosts file
alias hosts="sudo nano /etc/hosts"
alias ehosts="sudo /Applications/Brackets.app/Contents/MacOS/Brackets /etc/hosts"

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
function cd ()
{
    out="${RESET}${WHITE}↳  ${RESET}${CYAN}[DIRS]${RESET}${GREEN}"
    prev_rb="$(rbenv version-name)"
    path=${1:-~}

    command cd "$path" >/dev/null

    if [[ $? -eq 0 ]]; then
        current_rb="$(rbenv version-name)"

        if [[ "$current_rb" != "$prev_rb" ]]; then
            out+=" (using ruby ${RESET}${ORANGE}v$current_rb${RESET}${GREEN})"
        fi

        echo "${out/\[DIRS\]/$(dirs)}"
    fi
}
function ce ()
{
    cd "$1" && edit ./
}
function mk ()
{
    mkdir "$1" && cd "$1"
}
function mke ()
{
    mkdir "$1" && cd "$1" && edit ./
}
function cf ()
{
    cd "$1" && finder ./
}
function mkf ()
{
    mkdir "$1" && cd "$1" && finder ./
}
function cef ()
{
    cd "$1" && edit ./ && finder ./
}
function mkef ()
{
    mkdir "$1" && cd "$1" && edit ./ && finder ./
}

# Network
alias ip="curl icanhazip.com"
alias localip="ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Quickly edit this file
alias profile="edit ~/.bash_profile"
alias r="source ~/.bash_profile"
alias qr="export SHOW_SPLASH=0; source ~/.bash_profile; export SHOW_SPLASH=1"

# Finder
alias finder="open -a finder"
alias killfinder="killall Finder"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles TRUE && killall Finder"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles FALSE && killall Finder"

