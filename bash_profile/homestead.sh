# Homestead
alias homestead='function __homestead() { (cd ~/Homestead && vagrant $*); unset -f __homestead; }; __homestead'
alias h="homestead up"
alias hup="homestead up --provision"
alias hh="homestead halt"
alias hs="homestead ssh"
alias hp="homestead provision"
alias he="edit ~/Homestead/Homestead.yaml"
alias hu="homestead box update"

# Laravel
alias a="php artisan"
alias art="php artisan"
alias artisan="php artisan"

alias am="php artisan migrate"
alias arf="php artisan refresh"
alias arfs="php artisan refresh --seed"
alias acc="php artisan chache clear"

alias artm="php artisan migrate"
alias artrf="php artisan refresh"
alias artrfs="php artisan refresh --seed"
alias artcc="php artisan chache clear"

