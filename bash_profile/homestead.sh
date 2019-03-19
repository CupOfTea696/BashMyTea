# Homestead
function hcmd()
{
    ssh -qt vagrant@192.168.10.10 ". ~/.bash_aliases && $@"
}
function homestead() {
    ( cd ~/Homestead && vagrant $* )
}
function uphrepo() {
    ( cd ~/Homestead && git fetch --tags && git checkout $(git describe --tags $(git rev-list --tags --max-count=1)))
}
alias h="homestead up"
alias hup="homestead up --provision"
alias hrel="homestead reload --provision"
alias hh="homestead halt"
alias hs="homestead ssh"
alias hp="homestead provision"
alias he="edit ~/Homestead/Homestead.yaml"
alias hea="edit ~/Homestead/aliases"
alias hb="h && hcmd 'mkdir /vagrant/db; mysqldump -u homestead --all-databases > /vagrant/db/homestead_backup_\`date \"+%F_%H-%M-%S\"\`.sql'"
alias hrb="h && hcmd 'mysql -u homestead < \`ls -t /vagrant/db/homestead_backup_*.sql | head -1\`'"
alias hu="hb && uphrepo && homestead box update && homestead destroy -f && homestead box prune && hup && hrb"

# Laravel
alias a="php artisan --env=cli"
alias am="a migrate"
alias ams="a migrate --seed"
alias arb="a migrate:rollback"
alias arf="a migrate:refresh"
alias arfs="a migrate:refresh --seed"
alias acc="a cache:clear"
alias art="a"
alias artm="a migrate"
alias ams="a migrate --seed"
alias artrf="a --env=cli migrate:refresh"
alias artrfs="a --env=cli migrate:refresh --seed"
alias arcc="a --env=cli cache:clear"

