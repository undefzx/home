dpkg --get-selections > ~/Package.list
sudo cp /etc/apt/sources.list ~/sources.list
sudo apt-key exportall > ~/Repo.keys
rsync --progress /home/`whoami` /path/to/user/profile/backup/here

##  Reinstall now

#rsync --progress /path/to/user/profile/backup/here /home/`whoami`
#sudo apt-key add ~/Repo.keys
#sudo cp ~/sources.list /etc/apt/sources.list 
#sudo apt-get install dselect
#sudo dpkg --set-selections < ~/Package.list
#sudo dselect
