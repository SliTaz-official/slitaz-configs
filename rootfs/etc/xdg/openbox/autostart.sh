# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# DBUS message bus (automount removable devices)
dbus-launch --exit-with-session &

# Handel Hal events with ivman (notification with desktopbox).
ivman &

# Start PCmanFM as daemon for wallpaper and desktop icons.
pcmanfm -d &

# Start the panel.
lxpanel &

# Start Parcellite clipboard.
#parcellite &

# Desktop effects
#xcompmgr -c -r 10 &

# Set a background image using hsetroot (depends on imlib2).
#hsetroot -fill /usr/share/images/slitaz-background.png &

# Background color with xsetroot.
#xsetroot -solid "#222222" &
