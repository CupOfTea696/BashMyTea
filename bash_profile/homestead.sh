# Homestead
alias homestead='function __homestead() { (cd ~/Homestead && vagrant $*); unset -f __homestead; }; __homestead'
alias h="homestead up"
alias h:up="homestead up --provision"
alias h:h="homestead halt"
alias h:s="homestead ssh"
alias h:p="homestead provision"
alias h:e="edit ~/Homestead/Homestead.yaml"
alias h:u="rm ~/.vagrant.d/tmp/*; homestead box update"

