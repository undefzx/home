eval 'screen -x work'
if [ $? -ne 0 ]; then
	screen -S "work" -c ~/work_screenrc
fi
