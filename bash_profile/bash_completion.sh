export LC_CTYPE="utf-8"

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

### rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

