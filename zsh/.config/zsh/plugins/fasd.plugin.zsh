#
# ZSH Plugin for fasd
#

if [ $commands[fasd] ]; then # check if fasd is installed
    fasd_cache="${ZCACHEDIR:-$HOME/.cache}/fasd-init-cache"
    if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
        fasd --init auto >| "$fasd_cache"
    fi
    source "$fasd_cache"
    unset fasd_cache
    
    alias v='f -e "$EDITOR"' \
          o='a -e xdg-open' \
          j='zz'
fi


