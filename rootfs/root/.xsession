# ~/.xsession: Start X window session manually on your system (startx).
#
. /etc/slitaz/applications.conf
Xorg &
#xterm &
#xpad &
exec $WINDOW_MANAGER
