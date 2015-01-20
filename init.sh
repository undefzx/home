ln -s ~/home/.vimrc ~/.vimrc
ln -s ~/home/.tmux.conf ~/.tmux.conf
ln -s ~/home/.gitignore ~/.gitignore
ln -s ~/home/.bash_user ~/.bash_user
echo ". ~/.bash_user" >> ~/.bashrc
git config --global core.excludesfile ~/home/.gitignore
git config --global color.ui "auto"
git config --global user.name "Dmitriy Boyarshinov"
git config --global user.email "dmitriy.boyarshinov@gmail.com"
#git config --global apply.whitespace nowarn
if [ ! -d ~/bash_completion.d  ]; then
    mkdir ~/bash_completion.d
fi
wget https://raw.githubusercontent.com/bobthecow/git-flow-completion/master/git-flow-completion.bash -O ~/bash_completion.d/.git--completion.sh
