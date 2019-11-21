#
# ZSH Plugin for fzf
#


	# Source fzf completions
	[ -f /usr/share/fzf/completion.zsh ] && autoload -U /usr/share/fzf/completion.zsh

	# Source fzf keybindings
	[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh


	# FZF Defaults
	export FZF_DEFAULT_OPTS='--height 40% --reverse --border --inline-info --color=dark,bg+:235,hl+:10,pointer:5'
	# export ENHANCD_FILTER="fzf:peco:percol"
	# export ENHANCD_COMMAND='c'

	# unalias z so z function can work
	unalias z 2> /dev/null

	# fzf defaults
	# export FZF_DEFAULT_COLORS='--color=dark,fg:-1,bg:-1,hl:4,fg+:7,bg+:8,gutter:-1,hl+:4,info:8,border:8,prompt:4,pointer:3,marker:3,spinner:8,header:6'
	# export FZF_DEFAULT_OPTS="$FZF_DEFAULT_COLORS \
	# 	--exact \
	# 	--no-multi \
	# 	--no-mouse \
	# 	--height='40%' \
	# 	--layout='reverse' \
	# 	--inline-info \
	# 	--no-bold"
