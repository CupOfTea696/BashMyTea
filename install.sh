#!/bin/bash

DIR=`dirname $0`

if ! [[ $DIR = '.' ]]; then
    DIR="`pwd`/$DIR"
else
    DIR="`pwd`"
fi

clear

export LC_CTYPE="utf-8"

NON_INTERACTIVE=false

for i in "$@"
do
case $i in
    -n|--no-interaction)
    NON_INTERACTIVE=true
    shift # past argument=value
    ;;
    *)
            # unknown option
    ;;
esac
done

if [[ "$NON_INTERACTIVE" = true ]]; then
    echo 'Running in non-interactive mode... All packages will be installed.'
fi

mkdir ~/.tmp
cd ~/.tmp

sudo easy_install pip

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install bash-completion git node mysql wget

PHP_INSTALLED=false
if ! [[ "$NON_INTERACTIVE" = true ]]; then
    read -p "Do you want to install PHP 7.1? [y/n]" -n 1 -r
    echo
fi
if [[ $REPLY =~ ^[Yy]$ || "$NON_INTERACTIVE" = true ]]; then
    PHP_INSTALLED=true
    curl -s http://php-osx.liip.ch/install.sh | bash -s 7.1
    export PATH=/usr/local/php5/bin:$PATH
fi

COMPOSER_INSTALLED=false
if ! [[ "$NON_INTERACTIVE" = true ]]; then
    read -p "Do you want to install Composer? [y/n]" -n 1 -r
    echo
fi
if [[ $REPLY =~ ^[Yy]$ || "$NON_INTERACTIVE" = true ]]; then
    COMPOSER_INSTALLED=true
    ### Disable xdebug for composer
    sudo sed -e 's/^zend_extension/;zend_extension/g' /usr/local/php5/php.d/50-extension-xdebug.ini > 50-extension-xdebug.ini && sudo mv 50-extension-xdebug.ini /usr/local/php5/php.d/50-extension-xdebug.ini && sudo chown root:wheel /usr/local/php5/php.d/50-extension-xdebug.ini
    alias php="php -dzend_extension=xdebug.so $*"
    
    ### Install composer...
    php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
    php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === trim(file_get_contents('https://composer.github.io/installer.sig'))) { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    mv composer.phar /usr/local/bin/composer
    
    composer -V
    
    composer global require phpunit/phpunit ^5.1
    composer global require phpspec/phpspec ~2.0
    
    composer global require laravel/installer
fi

sudo npm install npm -g
sudo npm cache clean -f

node -v
npm -v

if ! [[ "$NON_INTERACTIVE" = true ]]; then
    read -p "Do you want to install Bower? [y/n]" -n 1 -r
    echo
fi
if [[ $REPLY =~ ^[Yy]$ || "$NON_INTERACTIVE" = true ]]; then
    sudo npm install -g bower
fi

if ! [[ "$NON_INTERACTIVE" = true ]]; then
    read -p "Do you want to install Gulp? [y/n]" -n 1 -r
    echo
fi
if [[ $REPLY =~ ^[Yy]$ || "$NON_INTERACTIVE" = true ]]; then
    sudo npm install -g gulp-cli
fi

if ! [[ "$NON_INTERACTIVE" = true ]]; then
    read -p "Do you want to install Grunt? [y/n]" -n 1 -r
    echo
fi
if [[ $REPLY =~ ^[Yy]$ || "$NON_INTERACTIVE" = true ]]; then
    sudo npm install -g grunt-cli
fi

BASHMARKS_INSTALLED=false
if ! [[ "$NON_INTERACTIVE" = true ]]; then
    read -p "Do you want to install Bashmarks? [y/n]" -n 1 -r
    echo
fi
if [[ $REPLY =~ ^[Yy]$ || "$NON_INTERACTIVE" = true ]]; then
    BASHMARKS_INSTALLED=true
    git clone https://github.com/huyng/bashmarks.git
    cd bashmarks
    make install
    cd ..
fi

sudo pip install thefuck

FORTUNE_INSTALLED=false
if ! [[ "$NON_INTERACTIVE" = true ]]; then
    read -p "Do you want to install Fortune & Cowsay? [y/n]" -n 1 -r
    echo
fi
if [[ $REPLY =~ ^[Yy]$ || "$NON_INTERACTIVE" = true ]]; then
    FORTUNE_INSTALLED=true
    git clone https://github.com/CupOfTea696/cowsay.git
    cd cowsay
    sh install.sh
    cd ..
    
    brew install fortune
fi

mkdir ~/.bin
curl https://raw.githubusercontent.com/LuRsT/hr/master/hr > ~/.bin/hr
chmod +x ~/.bin/hr

if ! [[ "$NON_INTERACTIVE" = true ]]; then
    read -p "Do you want to install Jekyll? [y/n]" -n 1 -r
    echo
fi
if [[ $REPLY =~ ^[Yy]$ || "$NON_INTERACTIVE" = true ]]; then
    sudo gem install jekyll jekyll-assets nokogiri octopress-minify-html redcarpet pygments.rb
fi

HOMESTEAD_INSTALLED=false
if ! [[ "$NON_INTERACTIVE" = true ]]; then
    read -p "Do you want to install laravel/homestead? [y/n]" -n 1 -r
    echo
fi
if [[ $REPLY =~ ^[Yy]$ || "$NON_INTERACTIVE" = true ]]; then
    HOMESTEAD_INSTALLED=true
    brew install caskroom/cask/brew-cask
    brew cask install vagrant virtualbox
    git clone https://github.com/laravel/homestead.git ~/Homestead
    git --git-dir ~/Homestead/.git checkout $(git --git-dir ~/Homestead/.git describe --tags)
    bash ~/Homestead/init.sh
    vagrant box add laravel/homestead
fi

cd ~
rm -rf .tmp

if ! [[ "$NON_INTERACTIVE" = true ]]; then
    rm ~/.bash_profile
fi
if [ -f ~/.bash_profile ]; then
    read -p "Do you want to replace your current .bash_profile (recommended)? If you choose no the Bash My Tea profile will be appended. [y/n]" -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        rm ~/.bash_profile
    fi
fi

# Generate .bash_profile
cat "$DIR/bash_profile/bash_completion.sh" >> ~/.bash_profile
if [[ "$PHP_INSTALLED" = true ]]; then
    cat "$DIR/bash_profile/php.sh" >> ~/.bash_profile
fi
if [[ "$COMPOSER_INSTALLED" = true ]]; then
    cat "$DIR/bash_profile/composer.sh" >> ~/.bash_profile
fi
cat "$DIR/bash_profile/usr_bin.sh" >> ~/.bash_profile
if [[ "$BASHMARKS_INSTALLED" = true ]]; then
    cat "$DIR/bash_profile/bashmarks.sh" >> ~/.bash_profile
fi
cat "$DIR/bash_profile/aliases.sh" >> ~/.bash_profile
if [[ "$HOMESTEAD_INSTALLED" = true ]]; then
    cat "$DIR/bash_profile/homestead.sh" >> ~/.bash_profile
fi
cat "$DIR/bash_profile/ps.sh" >> ~/.bash_profile

git config --global color.ui "auto"
git config --global core.editor nano
git config --global alias.forget '!git rm -r --cached . && git add . && git commit -am "Remove ignored files"'

mkdir ~/Development
mkdir ~/Downloads/_attachments
if [[ "$BASHMARKS_INSTALLED" = true ]]; then
    cd ~/Documents
    s documents
    
    cd ~/Development
    s projects
    
    cd ~/Downloads
    s downloads
fi

cd

echo "\n\n"
~/.bin/hr -
echo "All done!"
if ! [[ "$NON_INTERACTIVE" = true ]]; then
    echo "Press [Enter] to continue..."
fi
~/.bin/hr -

if ! [[ "$NON_INTERACTIVE" = true ]]; then
    read
fi
