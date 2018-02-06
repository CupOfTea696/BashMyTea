# Homestead
function hcmd()
{
    ssh -qt vagrant@192.168.10.10 ". ~/.bash_aliases && $@"
}
alias homestead='function __homestead() { (cd ~/Homestead && vagrant $*); unset -f __homestead; }; __homestead'
alias h="homestead up"
alias hup="homestead up --provision"
alias hh="homestead halt"
alias hs="homestead ssh"
alias hp="homestead provision"
alias he="edit ~/Homestead/Homestead.yaml"
alias hb="hcmd 'mysqldump -u homestead --all-databases > ~/dev/homestead_backup_\`date \"+%F_%H-%M-%S\"\`.sql'"
alias hrb="hcmd 'mysql -u homestead < \`ls -t ~/dev/homestead_backup_*.sql | head -1\`'"
alias hu="hb && homestead box update && homestead destroy -f && hup && hrb"

# Laravel
alias a="php artisan"
alias am="php artisan migrate"
alias arf="php artisan migrate:refresh"
alias arfs="php artisan migrate:refresh --seed"
alias acc="php artisan chache clear"
alias art="php artisan"
alias artm="php artisan migrate"
alias artrf="php artisan refresh"
alias artrfs="php artisan refresh --seed"
alias arcc="php artisan chache clear"

