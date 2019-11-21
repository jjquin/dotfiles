#!/usr/bin/env bash

# make sure we have pulled in and updated any submodules
# git submodule init
# git submodule update

# Make sure script is not run as root or using sudo
if [[ "$(whoami)" == *"root"* ]]; then
	echo "Do not run as root or with sudo" 
	exit 1
fi

# folders that should be installed for every setup 
BASE_FOLDERS=(
	git
	nvim
	scripts
	user
	yay
)

# Make sure the script is run from the dotfiles or _setup directories
if [[ -z "${DOTFILES}" ]] || [[ ! -d "${DOTFILES}" ]]; then
        if [[ -d "${HOME}/.dotfiles" ]]; then
                STOW_DIR="${HOME}/.dotfiles"
        elif [[ $(pwd) =~ "dotfiles" ]]; then
                STOW_DIR="$(pwd)"
	elif [[ $(pwd) =~ "_setup" ]]; then
		STOW_DIR="$(dirname $(pwd))"
        else
                echo "Cannot find dotfiles directory set DOTFILES variable or run command form dotfiles directory"
                exit 1
        fi
else
        STOW_DIR="${DOTFILES}"
fi

if [[ -z $(whereis stow) ]]; then
	echo "GNU Stow not installed."
	exit 1
fi

# Set basic stow options
CMD_OPTS="--no-folding --dotfiles --dir=${STOW_DIR} --target=${HOME} -Rv"

# Add hostname if host specific stow folder exists 
HOST_NAME=$(/usr/bin/cat /etc/hostname)
if echo $(ls -1d ${STOW_DIR}/*) | grep -qi ${HOST_NAME}; then
	BASE_FOLDERS+=(${HOST_NAME})
fi

# Combine base folders, hostname and setup arguments
ARGUMENTS=("$@")
APPS_LIST=$(printf '%s\n' "${BASE_FOLDERS[@]}" "${ARGUMENTS[@]}" | sort -u )

echo "Stowing apps for user: $(whoami)"

# Install apps for all users
for APP in ${APPS_LIST[@]}; do
	stow ${CMD_OPTS} ${APP}
done

echo "Done: Stowed the following apps:"
echo "${APPS_LIST}"

