#
# .zshrc
#
# Desc: Main zsh configuration file for JJ's dotfiles
#

fpath=(
	$ZDOTDIR/completions
	$ZDOTDIR/functions
	/usr/local/share/zsh/site-functions
	$fpath
)

# Source local config files
if [[ -d $ZDOTDIR/config ]]; then
	for config in $ZDOTDIR/config/*; do
		source $config
	done
fi

# Source aliases
if [[ -d $ZDOTDIR/aliases ]]; then
	for alias in $ZDOTDIR/aliases/*; do
		source $alias
	done
fi

# autoload functions
if [[ -d $ZDOTDIR/functions ]]; then
	for func in $ZDOTDIR/functions/*(:t); do
		autoload -U $func
	done
fi
# autoload completions
if [[ -d $ZDOTDIR/completions ]]; then 
	for comp in $ZDOTDIR/completions/*(:t); do
		autoload -U $comp
	done
fi

# Source any local plugins
# [[ -d $ZDOTDIR/plugins ]] && source $ZDOTDIR/plugins/**/*


# Load plugins installed from Arch and AUR
[[ -d /usr/share/zsh/plugins/zsh-history-substring-search ]] && \
	source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
[[ -d /usr/share/zsh/plugins ]] && source /usr/share/zsh/plugins/**/*.plugin.zsh

# Load powerlevel10k theme
[[ -d /usr/share/zsh-theme-powerlevel10k ]] && \
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme 2>/dev/null

# To customize prompt, run `p10k configure` or edit ~/.config/shell//.p10k.zsh.
[[ -f ~/.config/zsh/config/p10k.zsh ]] && source ~/.config/zsh/config/p10k.zsh


