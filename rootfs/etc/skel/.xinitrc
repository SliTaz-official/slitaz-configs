# ~/.xinitrc: Executed by Slim/LXDM login manager to startx X session.
# You can use F1 with Slim to change your window manager or configure
# it permanently with your personal applications.conf file.
#
. $HOME/.config/slitaz/applications.conf

case $1 in
	openbox|lxde*|xfce4|compiz|karmen|dwm) 
		exec ${1%-session}-session ;;
	razor*) 
		exec razor-session ;;
	enlightenment)
		exec enlightenment_start ;;
	fluxbox)
		exec start${1} ;;
	jwm|awesome|pekwm) 
		exec $1 ;;
	*) 
		exec $WINDOW_MANAGER ;;
esac
