# This shell script is run before Openbox launches.
# Environment variables set here are passed to the Openbox session.

# DBUS message bus (automount removables devices)
dbus-launch --exit-with-session &

# Handel Hal events with Ivman (notification with desktopbox).
ivman &

# Start PCmanFM as deamon for Wallpaper and desktop icons.
pcmanfm -d &

# Start the panel Freedesktop standard menu.
lxpanel &

# Start Pacellite clipboard manager.
#parcellite &

# Launch Xpad desktop notes utility.
#xpad &

# Desktop effects composer.
#xcompmgr -c -r 10 &

# Set a background image using hsetroot (depends on imlib2).
#hsetroot -fill /usr/share/images/slitaz-background.png &

# Background color with xsetroot.
#xsetroot -solid "#222222" &
