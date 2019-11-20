#!/usr/bin/env bash

# make sure we have pulled in and updated any submodules
# git submodule init
# git submodule update

# Make sure script is not run as root or using sudo
[[ "$(whoami)" == *"root"* ]] && echo "Do not run as root or with sudo"; exit 1

# folders that should be installed for every setup 
BASE_FOLDERS=(
	git
	nvim
	scripts
	user
	yay
)

# Set basic stow options
CMD_OPTS="--no-folding -Rvt ~ "

# Make sure the script is run from the dotfiles or _setup directories
CURR_DIR="$(basename $(pwd))" 
if [[ ${CURR_DIR} == "_setup" ]]; then
	# Add parent directory to stow options
	CMD_OPTS="-d ../ "
elif [[ ${CURR_DIR} != "dotfiles" ]]; then
	# Exit if script is not in correct directory
	echo "setup.sh must be run from the dotfiles or _setup"
	exit 1
fi

if [[ -z $(whence xstow) ]]; then
	STOW_CMD="$(whence xstow)"
	CMD_OPTS="-f ${CMD_OPTS}"
else
	STOW_CMD="$(whence stow)"
fi

# Add hostname if host specific stow folder exists 
HOST_NAME=$(cat /etc/hostname)
if echo $(ls -1d ../* *) | grep -i ${HOST_NAME}; then
	base+=${HOST_NAME}
fi

# Combine base folders, hostname and setup arguments
ARGUMENTS=("$@")
APPS_LIST=$(printf '%s\n' "${BASE_FOLDERS[@]}" "${ARGUMENTS[@]}" | sort -u )

echo "Stowing apps for user: $(whoami)"

# Install apps for all users
for APP in ${APPS_LIST[@]}; do
	${STOW_CMD} ${CMD_OPTS} ${APP}
done

echo "Done: Stowed the following apps:"
echo "${APPS_LIST}"

