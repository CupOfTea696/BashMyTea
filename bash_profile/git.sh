# Git Aliases
alias git:clean="git rm -r --cached . && git add .  && git commit -m 'rm ignored files'"
alias git:forget="git rm -r --cached . && git add .  && git commit -m 'rm ignored files'"
alias git:sync="git fetch upstream && git checkout master && git merge upstream/master --no-edit && git push"
alias git:log="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

