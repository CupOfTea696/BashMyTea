# Git Aliases
alias gitclean="git rm -r --cached . && git add .  && git commit -m 'rm ignored files'"
alias gitforget="git rm -r --cached . && git add .  && git commit -m 'rm ignored files'"
alias gitsync="git fetch upstream && git checkout master && git merge upstream/master --no-edit && git push"
alias gitlog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
alias gs="git status"
alias gaa="git add ."
alias gclean="git rm -r --cached . && git add .  && git commit -m 'rm ignored files'"
alias gforget="git rm -r --cached . && git add .  && git commit -m 'rm ignored files'"
alias gsync="git fetch upstream && git checkout master && git merge upstream/master --no-edit && git push"
alias glog="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

