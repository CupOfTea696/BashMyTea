# Bash My Tea

An install script for my most used command line tools & `.bash_profile`.

## Installing

Clone this repo, enter the directory and run `sh install.sh`. You may run this script in non-interactive mode by passing the flag `-n` or `--no-interaction`.
Please note that some of the tools installed might still ask interactive questions.

## Overview

### Installed Tools

 - [pip](https://pip.pypa.io)
 - [Homebrew](https://brew.sh)
   - bash_completion
   - git
   - mysql
   - node
   - wget
 - [PHP 7.1](http://www.php.net) (optional)
 - [Composer](https://getcomposer.org) (optional)
   - [phpunit/phpunit](https://phpunit.de)
   - [phpspec/phpspec](http://www.phpspec.net)
   - [laravel/installer](https://laravel.com)
 - [Node.js](https://nodejs.org)
   - [Bower](https://bower.io) (optional)
   - [Gulp](http://gulpjs.com) (optional)
   - [Grunt](https://gruntjs.com) (optional)
 - [Bashmarks](https://www.huyng.com/projects/bashmarks)
 - [thefuck](https://github.com/nvbn/thefuck)
 - [Fortune](https://www.wikiwand.com/en/Fortune_(Unix)) & [Cowsay](https://github.com/cupOfTea696/cowsay) (optional)
 - [hr](https://github.com/LuRsT/hr)
 - [Jekyll](https://jekyllrb.com) (optional)
 - [Laravel Homestead](https://laravel.com/docs/homestead) (optional)
   - [brew cask](https://github.com/caskroom/homebrew-cask)
   - [Vagrant](https://www.vagrantup.com)
   - [VirtualBox](https://www.virtualbox.org/)

### Generated Directories

 - `~/Development`
 - `~/Downloads/_attachments`

### Bashmarked Directories

These will only be bashmarked if you chose to install bashmarks.

 - `~/Development`: development
 - `~/Documents`: documents
 - `~/Downloads`: downloads

### Git Configuration

 - `color.ui`: `auto`
 - `core.editor`: `nano`
 - `alias.forget`: `'!git rm -r --cached . && git add . && git commit -am "rm ignored files"'`

### Aliases

Any aliases for tools you chose not to install will not be added to your `.bash_profile`.

#### Sudo

 - `fucking`
 - `pls`
 - `fak`

#### Directory Listing

 - `ls`: `ls -p`
 - `ll`: `ls -lp`
 - `la`: `ls -lAp`

#### Quick Navigation & Editing

 - `..`: Go up one directory
 - `...`: Go up two directories
 - `.2` - `.6`: Go up the respective number of directories
 - `b`: Return to the previous directory
 - `abs`: Convert relative path to absolute path
 - `lna`: Link, converting relative directories to absolute ones
 - `edit`: Edit a file using Brackets (You can change this to your own editor later)
 - `ce`: Browse to a directory and open it in your editor
 - `mke`: Create and browse into a directory, and open it in your editor
 - `hosts`: Edit the hosts file using `nano`

#### Editing your .bash_profile
 - `profile`: Edit your `.bash_profile`
 - `r`: Reload your `.bash_profile`

#### Finder
 - `finder`: Open a path in Finder
 - `killfinder`: Restart Finder
 - `showhidden`: Show hidden files in Finder
 - `hidehidden`: Hide hidden files in Finder

#### Network
 - `ip`: Get your IP
 - `localip`: Get your local IP

#### Git
 - `gitclean`: Remove files ignored by git
 - `gitforget`: Remove files ignored by git
 - `gitsync`: Sync origin/master branch with upstream/master branch
 - `gitlog`: Show a pretty git log
 - `g`: `git`
 - `ga`: `git add`
 - `gc`: `git commit`
 - `gp`: `git push`
 - `gs`: `git status`
 - `gaa`: `git add .`
 - `gclean`: `git rm -r --cached . && git add .  && git commit -m 'rm ignored files'`
 - `gforget`: `git rm -r --cached . && git add .  && git commit -m 'rm ignored files'`
 - `gsync`: `git fetch upstream && git checkout master && git merge upstream/master --no-edit && git push`
 - `glog`: `git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit`

#### Composer
 - `c`: `composer`
 - `cr`: `composer require`
 - `cu`: `composer update`
 - `ci`: `composer install`
 - `cgu`: `composer global update`
 - `cda`: `composer dump-autoload -o`

#### Homestead
 - `homestead`: Forwards Vagrant commands to the Homestead box
 - `h`: `homestead up`
 - `hup`: `homestead up --provision`
 - `hh`: `homestead halt`
 - `hs`: `homestead ssh`
 - `hp`: `homestead provision`
 - `he`: `edit ~/Homestead/Homestead.yaml`
 - `hu`: `homestead box update`

#### Laravel
- `a`: `php artisan`
- `art`: `php artisan`
- `artisan`: `php artisan`
- `am`: `php artisan migrate`
- `arf`: `php artisan refresh`
- `arfs`: `php artisan refresh --seed`
- `acc`: `php artisan chache clear`
- `artm`: `php artisan migrate`
- `artrf`: `php artisan refresh`
- `artrfs`: `php artisan refresh --seed`
- `artcc`: `php artisan chache clear`

## Screenshot

![Screenshot](Screenshot.png)
