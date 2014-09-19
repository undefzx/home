mkdir ~/home
cd ~/home
git clone https://github.com/undefzx/home.git ./
cp -r .vim ../
cp -r .tmux ../
./init.sh
./.vim/vim_init.sh
vim -c BundleInstall -c qa
