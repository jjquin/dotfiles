#
# .zprofile
#
# Desc: Load gnome keyring daemon 
#


	# Load Gnome Keyring Daemon
	if [ -n "$DISPLAY" ]; then
                eval $(gnome-keyring-daemon --start)
                export SSH_AUTH_SOCK
        fi
