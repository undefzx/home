# general
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git ctags

# vim
sudo apt-get install vim vim-nox-py2
#update-alternatives --config vim

# devel
sudo apt-get install linux-headers-$(uname -r) build-essential

# python
sudo apt-get python-pip
sudo apt-get install python2.7-dev

# virtualenv
sudo pip install virtualenv
mkdir ~/.virtualenvs
sudo pip install virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
