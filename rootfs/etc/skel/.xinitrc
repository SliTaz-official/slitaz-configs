# ~/.xinitrc: Executed by Slim/LXDM login manager to startx X session.
# You can use F1 with Slim to change your window manager or configure
# it permanently with your personal applications.conf file.
#
. $HOME/.config/slitaz/applications.conf

[ "$1" ] && WINDOW_MANAGER="$1"

EXEC="exec dbus-launch --sh-syntax --exit-with-session"
S="/tmp/X-output" #	http://root:root@tazpanel:82/boot.cgi?log#slim

LOG=0;	case "$LOG" in
	0) X="/dev/null"; echo WM_stdout '>' $X in $HOME/.xinitrc >$S ;W=$X ;;
	1) X=$S ; W=$X ; rm -f $W ;;
	2) X=$S ; W="$HOME/.wm_debug+warnings" ; rm -f $W $X ;;
esac

case "$WINDOW_MANAGER" in
	openbox|lxde*|lxqt*|xfce4|compiz|karmen|dwm|fluxbox*)
		$EXEC ${WINDOW_MANAGER%-session}-session ;;
	razor*)
		$EXEC razor-session ;;
	enlightenment)
		$EXEC enlightenment_start ;;
	*)
		$EXEC $WINDOW_MANAGER ;;
esac	2>>$W >>$X
