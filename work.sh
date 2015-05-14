#if test "$SSH_AUTH_SOCK" ; then
#    ln -sf $SSH_AUTH_SOCK ~/.ssh/ssh_auth_sock
#    export SSH_AUTH_SOCK=~/.ssh/ssh_auth_sock
#fi

eval 'tmux attach -t dev'
if [ $? -ne 0 ]; then
	tmux new -s dev
fi

