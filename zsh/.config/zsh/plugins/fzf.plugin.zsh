#
# ZSH Plugin for fzf
#


	# Source fzf completions
	[ -f /usr/share/fzf/completion.zsh ] && autoload -U /usr/share/fzf/completion.zsh

	# Source fzf keybindings
	[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh


	# FZF Defaults
	export FZF_DEFAULT_OPTS='--height 40% --reverse --border --inline-info --color=dark,bg+:235,hl+:10,pointer:5'
	export ENHANCD_FILTER="fzf:peco:percol"
	export ENHANCD_COMMAND='c'


