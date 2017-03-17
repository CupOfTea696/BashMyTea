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

# Quick oepn/edit
alias edit="open -a brackets"
alias finder="open -a finder"

