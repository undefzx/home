if test "$SSH_AUTH_SOCK" ; then
    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
fi

eval 'screen -x work'
if [ $? -ne 0 ]; then
	screen -S "work" -c ~/work_screenrc
fi
