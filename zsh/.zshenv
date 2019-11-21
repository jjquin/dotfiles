#
# .zshenv
#
# Desc: Set environment variables
#
	# Add ~/.local/bin to PATH
	[[ -d "$HOME/.local/bin" ]] && export PATH="$HOME/.local/bin:$PATH"

	# Set PAGER and MANPAGER to LESS
	export PAGER=less
	export MANPAGER=less

	# Set Applications to use Wayland instead of XWayland
	export MOZ_ENABLE_WAYLAND=1
	export QT_QPA_PLATFORM=wayland-egl
	export QT_QPA_PLATFORMTHEME=qt5ct
	export QT_WAYLAND_FORCE_DPI=96
	export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
	export QUTE_SKIP_WAYLAND_CHECK=1
	export SDL_VIDEODRIVER=wayland
	export _JAVA_AWT_WM_NONREPARENTING=1

	# Default programs
	export TERMINAL=kitty
	export EDITOR=nvim
	export VISUAL=nvim
	export BROWSER=firefox
	export SUDO_EDITOR=/usr/bin/nvim
	export READER=zathura
	export FILE=ranger
	export DOTFILES="$HOME/code/dotfiles"
	
	# Set default config directories 
	if [[ -z "$XDG_CONFIG_HOME" ]]; then
  		export XDG_CONFIG_HOME="$HOME/.config"
	fi
	if [[ -d "$XDG_CONFIG_HOME/zsh" ]]; then
  		export ZDOTDIR="$XDG_CONFIG_HOME/zsh/"
	fi
	export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
	# export user-emacs-directory="$XDG_CONFIG_HOME/emacs"

	# Set default cache directories
	if [[ -z "$XDG_CACHE_DIR" ]]; then
  		export XDG_CACHE_DIR="$HOME/.cache"
	fi
	if [[ -d "$XDG_CACHE_DIR/zsh" ]]; then
  		export ZCACHEDIR="$XDG_CACHE_DIR/zsh"
	else
		export ZCACHEDIR="$HOME"
	fi
	
	# Supposedly Waybar needs this for its indicator tray
	export XDG_CURRENT_DESKTOP=Unity

