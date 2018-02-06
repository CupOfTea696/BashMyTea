## GIT & DEVELOPMENT HAPPINESS ##

# --------------------
# Colors for the prompt
# --------------------
# Set the TERM var to xterm-256color
if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM=xterm-256color
fi
if tput setaf 1 &> /dev/null; then
    tput sgr0
    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
        # this is for xterm-256color
        BLACK=$(tput setaf 0)
        RED=$(tput setaf 1)
        GREEN=$(tput setaf 2)
        YELLOW=$(tput setaf 3)
        BLUE=$(tput setaf 4)
        MAGENTA=$(tput setaf 5)
        CYAN=$(tput setaf 6)
        WHITE=$(tput setaf 7)
        ORANGE=$(tput setaf 172)
        GREEN=$(tput setaf 190)
        PURPLE=$(tput setaf 141)
        BG_BLACK=$(tput setab 0)
        BG_RED=$(tput setab 1)
        BG_GREEN=$(tput setab 2)
        BG_BLUE=$(tput setab 4)
        BG_MAGENTA=$(tput setab 5)
        BG_CYAN=$(tput setab 6)
        BG_YELLOW=$(tput setab 226)
        BG_ORANGE=$(tput setab 172)
        BG_WHITE=$(tput setab 7)
    else
        MAGENTA=$(tput setaf 5)
        ORANGE=$(tput setaf 4)
        GREEN=$(tput setaf 2)
        PURPLE=$(tput setaf 1)
        WHITE=$(tput setaf 7)
    fi
    
    BOLD=$(tput bold)
    RESET=$(tput sgr0)
    UNDERLINE=$(tput sgr 0 1)
else
    BLACK="\[\e[0;30m\]"
    RED="\[\033[1;31m\]"
    ORANGE="\033[1;33m"
    GREEN="\033[1;32m"
    PURPLE="\033[1;35m"
    WHITE="\[\033[1;37m\]"
    YELLOW="\[\e[0;33m\]"
    CYAN="\[\e[0;36m\]"
    BLUE="\[\e[0;34m\]"
    BOLD=""
    RESET="\[\033[m\]"
fi

# Styles for cmd prompt
style_user="\[${RESET}${BLUE}\]"
style_host="\[${RESET}${PURPLE}\]"
style_path="\[${RESET}${CYAN}\]"
style_date="\[${RESET}${YELLOW}\]"
style_chars="\[${RESET}${WHITE}\]"
style_branch="${RED}"

style_success="\[${RESET}${GREEN}\]"
style_error="\[${RESET}${RED}\]"

# Date
alias now='echo $(date +"%d.%m.%Y, %l:%M%p")'

export SHOW_SPLASH=${SHOW_SPLASH:-1}

function sp {
    if [[ $SHOW_SPLASH -eq 0 ]]; then
        return
    fi
    
    clear
    echo
    echo "Welcome at $(hostname -s), $(whoami),"
    echo "It is $(now)"
    hr -
    echo $(git --version)
    echo $(composer -V)
    echo $(vagrant -v)
    hr -
    echo "${RESET}${PURPLE}"
    fortune -s | cowsay -f unicorn
    echo "${RESET}"
    hr -
}
sp

# Auto-complete git commands and branch names
GIT_PS1_SHOWDIRTYSTATE=true

# Define how the prompt is styled. Colorizes the directory path & git branch, puts your commands on a new line
PS1="\n"                                                                            # Newline
PS1+="\$([ \$? == 0 ] && echo \"${RESET}${GREEN}✓\" || echo \"${RESET}${RED}✗\" ) " # ✓ || ✗
PS1+="${style_user}$(whoami)"                                                       # User
PS1+="${style_chars}@"                                                              # @
PS1+="${style_host}\h"                                                              # Host
PS1+="${style_chars}: "                                                             # :
PS1+="${style_path}\w"                                                              # Working directory
PS1+="\$(prompt_git)"                                                               # Git details
PS1+="\n"                                                                           # Newline
PS1+="${style_chars}"                                                               #
PS1+="ϟ "                                                                           # ϟ
PS1+="\[${RESET}\]"                                                                 # Reset color

PS2="${style_chars} "
PS2+="ϟ "
PS2+="\[${RESET}\]"

PS4="  "

# Auto-delete merged git branches
alias git_delete_merged="git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"

# Long git to show + ? !
is_git_repo() {
    $(git rev-parse --is-inside-work-tree &> /dev/null)
}
is_git_dir() {
    $(git rev-parse --is-inside-git-dir 2> /dev/null)
}
get_git_branch() {
    local branch_name
    # Get the short symbolic ref
    branch_name=$(git symbolic-ref --quiet --short HEAD 2> /dev/null) ||
    # If HEAD isn't a symbolic ref, get the short SHA
    branch_name=$(git rev-parse --short HEAD 2> /dev/null) ||
    # Otherwise, just give up
    branch_name="(unknown)"
    printf $branch_name
}

# Git status information
prompt_git() {
  local git_info git_state uc us ut st
  if ! is_git_repo || is_git_dir; then
      return 1
  fi
  git_info=$(get_git_branch)
  # Check for uncommitted changes in the index
  if ! $(git diff --quiet --ignore-submodules --cached); then
      uc="+"
  fi
  # Check for unstaged changes
  if ! $(git diff-files --quiet --ignore-submodules --); then
      us="!"
  fi
  # Check for untracked files
  if [ -n "$(git ls-files --others --exclude-standard)" ]; then
      ut="${RED}?"
  fi
  # Check for stashed files
  if $(git rev-parse --verify refs/stash &>/dev/null); then
      st="$"
  fi
  git_state=$uc$us$ut$st
  # Combine the branch name and state information
  if [[ $git_state ]]; then
      git_info="$git_info${RESET}[$git_state${RESET}]"
  fi
  printf "${WHITE} on ${style_branch}${git_info}"
}

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###
