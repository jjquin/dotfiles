#
# .zshrc
#
# Desc: Main zsh configuration file for JJ's dotfiles
#

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/shell//.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

Start Neofetch
neofetch
