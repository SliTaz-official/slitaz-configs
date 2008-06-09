# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# DBUS message bus (automount removables devices)
dbus-launch --exit-with-session &

# Start PCmanFM as deamon for Wallpaper and desktop icons.
pcmanfm -d &

# Start the panel.
lxpanel &

# Start Pacellite clipboard.
#parcellite &

# Desktop effects
#xcompmgr -c -r 10 &

# Set a background image using hsetroot (depends on imlib2).
#hsetroot -fill /usr/share/images/slitaz-background.png &

# Background color with xsetroot.
#xsetroot -solid "#222222" &
